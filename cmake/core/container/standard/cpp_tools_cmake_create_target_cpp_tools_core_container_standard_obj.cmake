# ====== cpp_tools_cmake_create_target_cpp_tools_core_container_standard_obj.cmake
# ====================================
#       explanation
# ====================================
# Triggered by ${git_repo}/CMakeLists.txt.
#
# Collect all object targets under:
#
#     cpp_tools_core_container_standard_*
#
# and create:
#
#     cpp_tools_core_container_standard_obj
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
# RETURN_VAR_PREFIX =
#     CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_CONTAINER_STANDARD_OBJ
#
# ${RETURN_VAR_PREFIX}_TARGET_NAME
#     = cpp_tools_core_container_standard_obj
#
# ${RETURN_VAR_PREFIX}_TARGET_CREATED
#     = TRUE / FALSE

function(
    cpp_tools_cmake_create_target_cpp_tools_core_container_standard_obj
)

    # ====================================
    #       pre-variables
    # ====================================

    set(
        this_function_name
        "CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_CONTAINER_STANDARD_OBJ"
    )

    set(
        RETURN_VAR_PREFIX
        "${this_function_name}"
    )

    # ====================================
    #       includes
    # ====================================

    include(
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/tools/cpp_tools_cmake_create_aggregate_object_target.cmake"
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
    #       child modules
    # ====================================

    set(
        CPP_TOOLS_CORE_CONTAINER_STANDARD_MODULES

        traits
    )

    # ====================================
    #       create aggregate target
    # ====================================

    cpp_tools_cmake_create_aggregate_object_target(

        TARGET_NAME
            cpp_tools_core_container_standard_obj

        CHILD_MODULES
            ${CPP_TOOLS_CORE_CONTAINER_STANDARD_MODULES}

        CHILD_TARGET_PREFIX
            "cpp_tools_core_container_standard_"

        CHILD_FUNCTION_PREFIX
            "cpp_tools_cmake_create_target_cpp_tools_core_container_standard_"

        CHILD_CMAKE_DIR
            "${CMAKE_CURRENT_SOURCE_DIR}/cmake/core/container/standard"

        IS_SILENT_MODE
            ${ARG_IS_SILENT_MODE}
    )

    # ====================================
    #       pack return variables
    # ====================================

    set(
        ${RETURN_VAR_PREFIX}_TARGET_NAME
        cpp_tools_core_container_standard_obj
    )

    set(
        ${RETURN_VAR_PREFIX}_TARGET_CREATED
        ${CPP_TOOLS_CMAKE_CREATE_AGGREGATE_OBJECT_TARGET_TARGET_CREATED}
    )

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