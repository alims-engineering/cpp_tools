#include <cpp_tools/core/file/standard/backend/read_file_unchecked.h>
#include <filesystem>
#include <string>
#include <fstream>


namespace cpp_tools::core::file::standard::backend {
    
    std::string read_file_unchecked(
        const std::filesystem::path& path
    ) {
        std::ifstream file(path, std::ios::binary);

        file.seekg(0, std::ios::end);
        auto size = static_cast<std::size_t>(file.tellg());
        file.seekg(0);

        std::string result(size, '\0');
        file.read(result.data(), size);

        return result;
    }

    
}