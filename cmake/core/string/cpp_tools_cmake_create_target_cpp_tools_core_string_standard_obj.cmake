# ====== cpp_tools_cmake_create_target_cpp_tools_core_string_standard_obj.cmake
# ====================================
#       explanation
# ====================================
# Triggered by ${git_repo}/CMakeLists.txt.
#
# Collect all object targets under:
#
#     cpp_tools_core_string_standard_*
#
# and create:
#
#     cpp_tools_core_string_standard_obj
#
# If required child object targets do not exist,
# corresponding create scripts will be included automatically.

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
# RETURN_VAR_PREFIX = CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_STRING_STANDARD_OBJ
# ${RETURN_VAR_PREFIX}_TARGET_NAME      = cpp_tools_core_string_standard_obj
# ${RETURN_VAR_PREFIX}_TARGET_CREATED   = TRUE / FALSE

function(cpp_tools_cmake_create_target_cpp_tools_core_string_standard_obj)

    # ====================================
    #       pre-variables
    # ====================================

    set(
        this_function_name
        "CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_STRING_STANDARD_OBJ"
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
        "cpp_tools_core_string_standard_obj"
    )

    set(
        ${RETURN_VAR_PREFIX}_TARGET_CREATED
        FALSE
    )

    # ====================================
    #       child modules
    # ====================================

    set(
        CPP_TOOLS_CORE_STRING_STANDARD_MODULES

        backend

        # algorithm
        # pipeline
        # executor
        # policy
    )

    # ====================================
    #       print modules
    # ====================================

    if(NOT ARG_IS_SILENT_MODE)

        message(STATUS "")
        message(
            STATUS
            "[${this_function_name} - child modules]"
        )

        foreach(
            temp_module
            IN LISTS
            CPP_TOOLS_CORE_STRING_STANDARD_MODULES
        )

            message(
                STATUS
                "  ${temp_module}"
            )

        endforeach()

    endif()

    # ====================================
    #       ensure child object targets
    # ====================================

    foreach(
        temp_module
        IN LISTS
        CPP_TOOLS_CORE_STRING_STANDARD_MODULES
    )

        set(
            temp_target_name
            "cpp_tools_core_string_standard_${temp_module}_obj"
        )

        set(
            temp_function_name
            "cpp_tools_cmake_create_target_cpp_tools_core_string_standard_${temp_module}_obj"
        )

        set(
            temp_cmake_file
            "${CMAKE_CURRENT_SOURCE_DIR}/cmake/core/string/${temp_function_name}.cmake"
        )

        if(
            NOT TARGET
            ${temp_target_name}
        )

            include("${temp_cmake_file}")

            cmake_language(
                CALL
                ${temp_function_name}

                IS_SILENT_MODE
                    ${ARG_IS_SILENT_MODE}
            )

        endif()

    endforeach()

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

        foreach(
            temp_module
            IN LISTS
            CPP_TOOLS_CORE_STRING_STANDARD_MODULES
        )

            target_sources(
                ${${RETURN_VAR_PREFIX}_TARGET_NAME}
                PRIVATE
                "$<TARGET_OBJECTS:cpp_tools_core_string_standard_${temp_module}_obj>"
            )

            target_link_libraries(
                ${${RETURN_VAR_PREFIX}_TARGET_NAME}
                PUBLIC
                cpp_tools_core_math_standard_${temp_module}_obj
            )

        endforeach()

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