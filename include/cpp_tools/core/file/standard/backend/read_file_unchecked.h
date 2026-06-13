#pragma once

#include <filesystem>
#include <string>

namespace cpp_tools::core::file::standard::backend {

	std::string read_file_unchecked(const std::filesystem::path& path);
	
}
