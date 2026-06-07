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

include(
    cmake/cpp_tools_cmake_create_target_cpp_tools_core_math_std_backend_obj.cmake
)
cpp_tools_cmake_create_target_cpp_tools_core_math_std_backend_obj()

get_target_property(
    TEMP_TYPE
    cpp_tools_core_math_std_backend_obj
    TYPE
)

message(
    STATUS
    "cpp_tools_core_math_std_backend TYPE = ${TEMP_TYPE}"
)