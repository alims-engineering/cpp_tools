# ====== cpp_tools_cmake_create_aggregate_object_target.cmake
# ====================================
#       explanation
# ====================================
# Create an aggregate OBJECT target.
#
# This function is used for layers that do not compile their own source files,
# but instead collect child OBJECT targets and expose their object files to the
# next aggregation level.
#
# The function will:
#   1. Ensure all child object targets exist.
#   2. Include child creation scripts automatically when needed.
#   3. Create the aggregate OBJECT target.
#   4. Attach child object files and link child targets.
#
# ====================================
#       parameters
# ====================================
# TARGET_NAME          : Name of the aggregate OBJECT target to create.
# CHILD_MODULES        : Child module names, used to build child target names.
# CHILD_TARGET_PREFIX  : Prefix before each child module name.
# CHILD_TARGET_SUFFIX  : Suffix after each child module name.
# CHILD_FUNCTION_PREFIX: Function-name prefix for child creation functions.
# CHILD_CMAKE_DIR      : Directory that contains child creation scripts.
# IS_SILENT_MODE       : Disable output messages when TRUE.
#
# ====================================
#       parameter default value
# ====================================
# IS_SILENT_MODE = FALSE
#
# ====================================
#       return variables
# ====================================
# return_var_prefix = CPP_TOOLS_CMAKE_CREATE_AGGREGATE_OBJECT_TARGET
# ${return_var_prefix}_TARGET_NAME    = value
# ${return_var_prefix}_TARGET_CREATED  = TRUE / FALSE

function(cpp_tools_cmake_create_aggregate_object_target)

    # ====================================
    #       pre-variables
    # ====================================

    set(
        this_function_name
        "CPP_TOOLS_CMAKE_CREATE_AGGREGATE_OBJECT_TARGET"
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
        TARGET_NAME
        CHILD_TARGET_PREFIX
        CHILD_TARGET_SUFFIX
        CHILD_FUNCTION_PREFIX
        CHILD_CMAKE_DIR
        IS_SILENT_MODE
    )

    set(
        multiValueArgs
        CHILD_MODULES
    )

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

    if(NOT DEFINED ARG_CHILD_TARGET_SUFFIX)
        set(
            ARG_CHILD_TARGET_SUFFIX
            "_obj"
        )
    endif()

    # ====================================
    #       validate parameters
    # ====================================

    if(NOT DEFINED ARG_TARGET_NAME OR ARG_TARGET_NAME STREQUAL "")
        message(
            FATAL_ERROR
            "[${this_function_name}] TARGET_NAME is required."
        )
    endif()

    if(NOT DEFINED ARG_CHILD_TARGET_PREFIX OR ARG_CHILD_TARGET_PREFIX STREQUAL "")
        message(
            FATAL_ERROR
            "[${this_function_name}] CHILD_TARGET_PREFIX is required."
        )
    endif()

    if(NOT DEFINED ARG_CHILD_FUNCTION_PREFIX OR ARG_CHILD_FUNCTION_PREFIX STREQUAL "")
        message(
            FATAL_ERROR
            "[${this_function_name}] CHILD_FUNCTION_PREFIX is required."
        )
    endif()

    if(NOT DEFINED ARG_CHILD_CMAKE_DIR OR ARG_CHILD_CMAKE_DIR STREQUAL "")
        message(
            FATAL_ERROR
            "[${this_function_name}] CHILD_CMAKE_DIR is required."
        )
    endif()

    if(NOT ARG_CHILD_MODULES)
        message(
            FATAL_ERROR
            "[${this_function_name}] CHILD_MODULES is required."
        )
    endif()

    # ====================================
    #       local variables
    # ====================================

    set(
        ${RETURN_VAR_PREFIX}_TARGET_NAME
        "${ARG_TARGET_NAME}"
    )

    set(
        ${RETURN_VAR_PREFIX}_TARGET_CREATED
        FALSE
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
            ARG_CHILD_MODULES
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
        ARG_CHILD_MODULES
    )

        set(
            temp_target_name
            "${ARG_CHILD_TARGET_PREFIX}${temp_module}${ARG_CHILD_TARGET_SUFFIX}"
        )

        set(
            temp_function_name
            "${ARG_CHILD_FUNCTION_PREFIX}${temp_module}${ARG_CHILD_TARGET_SUFFIX}"
        )

        set(
            temp_cmake_file
            "${ARG_CHILD_CMAKE_DIR}/${temp_module}/${temp_function_name}.cmake"
        )

        if(NOT TARGET ${temp_target_name})

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

    if(NOT TARGET ${${RETURN_VAR_PREFIX}_TARGET_NAME})

        add_library(
            ${${RETURN_VAR_PREFIX}_TARGET_NAME}
            OBJECT
        )

        foreach(
            temp_module
            IN LISTS
            ARG_CHILD_MODULES
        )

            target_sources(
                ${${RETURN_VAR_PREFIX}_TARGET_NAME}
                PUBLIC
                "$<TARGET_OBJECTS:${ARG_CHILD_TARGET_PREFIX}${temp_module}${ARG_CHILD_TARGET_SUFFIX}>"
            )

            target_link_libraries(
                ${${RETURN_VAR_PREFIX}_TARGET_NAME}
                PUBLIC
                ${ARG_CHILD_TARGET_PREFIX}${temp_module}${ARG_CHILD_TARGET_SUFFIX}
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