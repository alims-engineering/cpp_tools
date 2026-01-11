#pragma once


#include <string>
#include <iostream>

#include <cpptools/framework/string/algorithm/serial/trim_and_unquote.h>
#include <cpptools/modules/console/backend/serial/config/ensure_console_utf8.h>



namespace cpptools::modules::console::pipeline::serial {

	inline std::string get_input_path() {

		namespace c_string = cpptools::framework::string::algorithm::serial;
		namespace c_console = cpptools::modules::console::backend::serial;

		c_console::ensure_console_utf8();


		// get
		std::string path;
		if (!std::getline(std::cin, path)) {
			return "";
		}

		c_string::trim_and_unquote(path);

		return path;  // FIN

	}

}