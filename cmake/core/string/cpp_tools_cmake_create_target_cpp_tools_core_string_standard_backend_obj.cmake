# ====== cpp_tools_cmake_create_target_cpp_tools_core_string_standard_backend_obj.cmake
# ====================================
#       explanation
# ====================================
# Triggered by ${git_repo}/CMakeLists.txt.
#
# Create target:
#     cpp_tools_core_string_standard_backend_obj
#
# Collect source files from:
#     ${git_repo}/src/core/string/standard/backend/
#
# User include style:
#     #include <cpp_tools/core/string/standard/backend/backend.hpp>
#
# This target depends on:
#     cpp_tools_core_string_standard_backend_headers

# ====================================
#       parameters
# ====================================
# IS_SILENT_MODE : Disable output messages when TRUE.

# ====================================
#       parameter default value
# ====================================
# IS_SILENT_MODE = FALSE

# ====================================
#       return variables
# ====================================
# RETURN_VAR_PREFIX =
#     CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_OBJ
#
# ${RETURN_VAR_PREFIX}_TARGET_NAME
#     = cpp_tools_core_string_standard_backend_obj
#
# ${RETURN_VAR_PREFIX}_TARGET_CREATED
#     = TRUE / FALSE

function(
    cpp_tools_cmake_create_target_cpp_tools_core_string_standard_backend_obj
)

    # ====================================
    #       pre-variables
    # ====================================

    set(
        this_function_name
        "CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_OBJ"
    )

    set(
        RETURN_VAR_PREFIX
        "${this_function_name}"
    )

    # ====================================
    #       parameters
    # ====================================

    set(options)

    set(
        oneValueArgs
        IS_SILENT_MODE
    )

    set(multiValueArgs)

    cmake_parse_arguments(
        ARG
        "${options}"
        "${oneValueArgs}"
        "${multiValueArgs}"
        ${ARGN}
    )

    # ====================================
    #       parameter default value
    # ====================================

    if(NOT DEFINED ARG_IS_SILENT_MODE)

        set(
            ARG_IS_SILENT_MODE
            FALSE
        )

    endif()

    # ====================================
    #       local variables
    # ====================================

    set(
        ${RETURN_VAR_PREFIX}_TARGET_NAME
        "cpp_tools_core_string_standard_backend_obj"
    )

    set(
        ${RETURN_VAR_PREFIX}_TARGET_CREATED
        FALSE
    )

    # ====================================
    #       collect source files
    # ====================================

    file(
        GLOB_RECURSE
        CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_SOURCE_FILES
        CONFIGURE_DEPENDS

        "${CMAKE_CURRENT_SOURCE_DIR}/src/core/string/standard/backend/*.c"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/core/string/standard/backend/*.cc"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/core/string/standard/backend/*.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/core/string/standard/backend/*.cxx"
    )

    # ====================================
    #       ensure source files
    # ====================================

    if(NOT CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_SOURCE_FILES)

        set(
            CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_SOURCE_FILES
            "${CMAKE_CURRENT_SOURCE_DIR}/src/core/string/standard/backend/cpp_tools_dummy.cpp"
        )

    endif()

    # ====================================
    #       print collected files
    # ====================================

    if(NOT ARG_IS_SILENT_MODE)

        message(STATUS "")
        message(
            STATUS
            "[${this_function_name} - collect source files]"
        )

        message(STATUS "")
        message(STATUS "CPP FILES:")

        if(CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_SOURCE_FILES)

            foreach(
                temp_file
                IN LISTS
                CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_SOURCE_FILES
            )

                message(
                    STATUS
                    "  ${temp_file}"
                )

            endforeach()

        else()

            message(
                STATUS
                "  <EMPTY>"
            )

        endif()

    endif()

    # ====================================
    #       ensure dependency target
    # ====================================

    if(
        NOT TARGET
        cpp_tools_core_string_standard_backend_headers
    )

        include(
            "${CMAKE_CURRENT_SOURCE_DIR}/cmake/core/string/cpp_tools_cmake_create_target_cpp_tools_core_string_standard_backend_headers.cmake"
        )

        cpp_tools_cmake_create_target_cpp_tools_core_string_standard_backend_headers(
            IS_SILENT_MODE
                ${ARG_IS_SILENT_MODE}
        )

    endif()

    # ====================================
    #       create target
    # ====================================

    if(
        NOT TARGET
        ${${RETURN_VAR_PREFIX}_TARGET_NAME}
    )

        add_library(
            ${${RETURN_VAR_PREFIX}_TARGET_NAME}
            OBJECT
        )

        target_sources(
            ${${RETURN_VAR_PREFIX}_TARGET_NAME}

            PRIVATE
                ${CPP_TOOLS_CORE_STRING_STANDARD_BACKEND_SOURCE_FILES}
        )

        target_link_libraries(
            ${${RETURN_VAR_PREFIX}_TARGET_NAME}

            PUBLIC
                cpp_tools_core_string_standard_backend_headers
        )

        set(
            ${RETURN_VAR_PREFIX}_TARGET_CREATED
            TRUE
        )

    endif()

    # ====================================
    #       print return variables
    # ====================================

    if(NOT ARG_IS_SILENT_MODE)

        message(STATUS "")
        message(
            STATUS
            "[${RETURN_VAR_PREFIX} - print return variables]"
        )

        foreach(
            temp_print_return_var
            IN ITEMS
            "${RETURN_VAR_PREFIX}_TARGET_NAME"
            "${RETURN_VAR_PREFIX}_TARGET_CREATED"
        )

            message(
                STATUS
                "${temp_print_return_var} = ${${temp_print_return_var}}"
            )

        endforeach()

    endif()

    # ====================================
    #       return variables
    # ====================================

    set(
        ${RETURN_VAR_PREFIX}_TARGET_NAME
        ${${RETURN_VAR_PREFIX}_TARGET_NAME}
        PARENT_SCOPE
    )

    set(
        ${RETURN_VAR_PREFIX}_TARGET_CREATED
        ${${RETURN_VAR_PREFIX}_TARGET_CREATED}
        PARENT_SCOPE
    )

endfunction()