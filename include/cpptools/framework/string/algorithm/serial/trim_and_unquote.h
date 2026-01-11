#pragma once

#include <string>

#include <cpptools/core/string/function/trim.h>
#include <cpptools/core/string/function/unquote.h>

namespace cpptools::framework::string::algorithm::serial {

	inline void trim_and_unquote(std::string& s) {
		namespace c_core_str = cpptools::core::string::function;

		c_core_str::trim(s);
		c_core_str::unquote(s);
	}
}

