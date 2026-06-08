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
    "${CMAKE_CURRENT_LIST_DIR}/include/cpp_tools"
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
#  include ${git_repo}/cmake files
# ============================================

file(
    GLOB_RECURSE
    CPP_TOOLS_CORE_CMAKE_FILES
    CONFIGURE_DEPENDS

    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/core/*.cmake"
)

foreach(temp_cmake_file IN LISTS CPP_TOOLS_CORE_CMAKE_FILES)

    include(
        "${temp_cmake_file}"
    )

endforeach()

CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_MATH_STANDARD_OBJ()
CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_OBJ()