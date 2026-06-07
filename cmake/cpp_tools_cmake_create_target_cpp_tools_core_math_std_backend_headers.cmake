# ====== cpp_tools_cmake_create_target_cpp_tools_core_math_std_backend_headers.cmake
# ====================================
#		explanation
# ====================================
# Triggered by ${git_repo}/CMakeLists.txt.
#
# Create target:
#     cpp_tools_core_math_std_backend_headers
#
# Collect header files from:
#     ${git_repo}/include/cpptools/core/math/std/backend/
#
# User include style:
#     #include <cpptools/core/math/std/backend/backend.hpp>

# ====================================
#		parameters
# ====================================
# IS_SILENT_MODE : Disable output messages when TRUE.

# ====================================
#		parameter default value
# ====================================
# IS_SILENT_MODE = FALSE

# ====================================
#       return variables
# ====================================
# return_var_prefix = CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_MATH_STD_BACKEND_HEADERS
#
# ${return_var_prefix}_TARGET_NAME		= cpp_tools_core_math_std_backend_headers
# ${return_var_prefix}_TARGET_CREATED   = TRUE / FALSE

function(cpp_tools_cmake_create_target_cpp_tools_core_math_std_backend_headers)

	# ====================================
	#		pre-variables
	# ====================================

	set(
		this_function_name
		"CPP_TOOLS_CMAKE_CREATE_TARGET_CPP_TOOLS_CORE_MATH_STD_BACKEND_HEADERS"
	)

	set(
		return_var_prefix
		"${this_function_name}"
	)

	# ====================================
	#		parameters
	# ====================================

	set(options)

	set(oneValueArgs
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
	#		parameter default value
	# ====================================

	if(NOT DEFINED ARG_IS_SILENT_MODE)
		set(ARG_IS_SILENT_MODE FALSE)
	endif()

	# ====================================
	#       local variables
	# ====================================

	set(
		${return_var_prefix}_TARGET_NAME
		"cpp_tools_core_math_std_backend_headers"
	)

	set(
		${return_var_prefix}_TARGET_CREATED
		FALSE
	)

	# ====================================
	#       collect header files
	# ====================================

	file(
		GLOB_RECURSE
		CPP_TOOLS_CORE_MATH_STD_BACKEND_HEADER_FILES
		CONFIGURE_DEPENDS

		"${CMAKE_CURRENT_SOURCE_DIR}/include/cpptools/core/math/std/backend/*.h"
		"${CMAKE_CURRENT_SOURCE_DIR}/include/cpptools/core/math/std/backend/*.hh"
		"${CMAKE_CURRENT_SOURCE_DIR}/include/cpptools/core/math/std/backend/*.hpp"
		"${CMAKE_CURRENT_SOURCE_DIR}/include/cpptools/core/math/std/backend/*.hxx"
	)

	# ====================================
	#       print collected files
	# ====================================

	if(NOT ARG_IS_SILENT_MODE)

		message(STATUS "")
		message(STATUS "[${this_function_name} - collect header files]")

		message(STATUS "")
		message(STATUS "HEADER FILES:")

		if(CPP_TOOLS_CORE_MATH_STD_BACKEND_HEADER_FILES)

			foreach(temp_file IN LISTS CPP_TOOLS_CORE_MATH_STD_BACKEND_HEADER_FILES)
				message(STATUS "  ${temp_file}")
			endforeach()

		else()

			message(STATUS "  <EMPTY>")

		endif()

	endif()

	# ====================================
	#       create target
	# ====================================

	if(NOT TARGET ${${return_var_prefix}_TARGET_NAME})

		add_library(
			${${return_var_prefix}_TARGET_NAME}
			INTERFACE
		)

		target_include_directories(
			${${return_var_prefix}_TARGET_NAME}

			INTERFACE
				"$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
				"$<INSTALL_INTERFACE:include>"
		)

		target_sources(
			${${return_var_prefix}_TARGET_NAME}

			INTERFACE
				FILE_SET HEADERS
				BASE_DIRS
					"${CMAKE_CURRENT_SOURCE_DIR}/include"
				FILES
					${CPP_TOOLS_CORE_MATH_STD_BACKEND_HEADER_FILES}
		)

		set(
			${return_var_prefix}_TARGET_CREATED
			TRUE
		)

	endif()

	# ====================================
	#       print return variables
	# ====================================

	if(NOT ARG_IS_SILENT_MODE)

		message(STATUS "")
		message(STATUS "[${return_var_prefix} - print return variables]")

		foreach(temp_print_return_var IN ITEMS
			"${return_var_prefix}_TARGET_NAME"
			"${return_var_prefix}_TARGET_CREATED"
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
		${return_var_prefix}_TARGET_NAME
		${${return_var_prefix}_TARGET_NAME}
		PARENT_SCOPE
	)

	set(
		${return_var_prefix}_TARGET_CREATED
		${${return_var_prefix}_TARGET_CREATED}
		PARENT_SCOPE
	)

endfunction()