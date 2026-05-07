# CMakeLists.txt for the cpptools library.
# Location: C:\..\libs\cpptools\
cmake_minimum_required(VERSION 3.28)
project(cpptools 
    VERSION 0.1.0
    LANGUAGES CXX
)

message(STATUS "TOP LEVEL CMake Loaded")

# preparation include<lib> start
include(FetchContent)
#include(cmake/cpp_tools_bootstrap_cmake_tools.cmake)
#cpp_tools_bootstrap_cmake_tools()




# --- 修正 1：使用 CMAKE_CURRENT_LIST_DIR 才是 cpptools 子模块路径 ---
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/Modules")
message(STATUS "CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")

# --- 修正 2：确认模块已加载 ---
include(GenerateRecursiveAggregateHeadersToUpperDirForEachLevel)
include(GenerateAggregateHeadersForEachLevelIgnoreBuild)


# --- 修正 3：正确调用（位置参数，不要使用 SRC_DIR=xxx 这种） ---
set(AUTO_GENERATED_ROOT "${CMAKE_BINARY_DIR}/auto_generated")



generate_aggregate_headers_for_each_level_ignore_build(
    "${CMAKE_CURRENT_LIST_DIR}/include"
    "${CMAKE_CURRENT_LIST_DIR}/include"
)


generate_recursive_aggregate_headers_to_upper_dir_for_each_level(
    "${CMAKE_CURRENT_LIST_DIR}/include/cpptools"
)


# ============================================
# 4. 自动收集所有源文件（默认编译全部）
# ============================================
file(GLOB_RECURSE CPPTOOLS_SOURCES
    "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/src/*.c"
)

message(STATUS "Found ${CPPTOOLS_SOURCES} source files")


# ============================================
# 5. 选项：用户可以选择要构建的类型
# ============================================
option(CPPTOOLS_BUILD_SHARED "Build shared library (DLL/SO)" ON)
option(CPPTOOLS_BUILD_STATIC "Build static library (LIB/A)" ON)
option(CPPTOOLS_BUILD_HEADER_ONLY "Build header-only interface (no binary)" ON)


# ============================================
# 6. 创建 OBJECT 库（共享编译产物，避免重复编译）
# ============================================


# ============================================
# 7. 动态库 (SHARED)
# ============================================
if(CPPTOOLS_BUILD_SHARED AND CPPTOOLS_SOURCES)
    add_library(cpptools_shared SHARED ${CPPTOOLS_SOURCES})
    
    target_include_directories(cpptools_shared
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
            $<INSTALL_INTERFACE:include>
        PRIVATE
            ${CMAKE_CURRENT_LIST_DIR}/src
    )
    
    if(WIN32)
        target_compile_definitions(cpptools_shared
            PUBLIC
                CPPTOOLS_SHARED_EXPORTS
            PRIVATE
                CPPTOOLS_SHARED_BUILD
                $<$<CXX_COMPILER_ID:MSVC>:_CRT_SECURE_NO_WARNINGS>
        )
    endif()
    
    set_target_properties(cpptools_shared PROPERTIES
        OUTPUT_NAME cpptools
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/shared  # 不同目录
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/shared  # 不同目录
    )
    
    message(STATUS "Shared library enabled: cpptools_shared")
endif()
# ============================================
# 8. 静态库 (STATIC)
# ============================================
if(CPPTOOLS_BUILD_STATIC AND CPPTOOLS_SOURCES)
    add_library(cpptools_static STATIC ${CPPTOOLS_SOURCES})
    
    target_include_directories(cpptools_static
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
            $<INSTALL_INTERFACE:include>
        PRIVATE
            ${CMAKE_CURRENT_LIST_DIR}/src
    )
    
    target_compile_definitions(cpptools_static
        PRIVATE
            $<$<CXX_COMPILER_ID:MSVC>:_CRT_SECURE_NO_WARNINGS>
    )
    
    set_target_properties(cpptools_static PROPERTIES
        OUTPUT_NAME cpptools_static
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/static  # 不同目录
    )
    
    message(STATUS "Static library enabled: cpptools_static")
endif()

# ============================================
# 9. Header-Only 接口库 (源码级使用)
# ============================================
if(CPPTOOLS_BUILD_HEADER_ONLY)
    add_library(cpptools_header_only INTERFACE)
    
    # 传递头文件路径
    target_include_directories(cpptools_header_only
        INTERFACE
            ${CMAKE_CURRENT_LIST_DIR}/include
    )
    
    message(STATUS "Header-only interface enabled: cpptools_header_only")
endif()

# ============================================
# 10. 创建默认别名（根据优先级选择）
# ============================================
# 优先级：SHARED > STATIC > HEADER_ONLY
if(TARGET cpptools_shared)
    add_library(cpptools ALIAS cpptools_shared)
    message(STATUS "Default target 'cpptools' -> shared library")
elseif(TARGET cpptools_static)
    add_library(cpptools ALIAS cpptools_static)
    message(STATUS "Default target 'cpptools' -> static library")
else()
    add_library(cpptools ALIAS cpptools_header_only)
    message(STATUS "Default target 'cpptools' -> header-only")
endif()


# binary root 必须最先导出
include(cmake/msvs/cpptools_export_binary_root_props.cmake)
cpptools_export_binary_root_props()



# -------- SDL framework（可选） --------

#option(CPPTOOLS_ENABLE_SDL3 "Enable SDL3 support" ON)




#option(CPPTOOLS_ENABLE_FFMPEG "Enable FFmpeg support" ON)

#if(CPPTOOLS_ENABLE_FFMPEG)
 # include(cmake/dependencies/ffmpeg/ffmpeg.cmake)
  #cpptools_enable_ffmpeg()
#endif()




