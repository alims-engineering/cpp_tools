#pragma once

#include <filesystem>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

namespace cpp_tools::core::file::standard::backend {

    // 
    // ====================================
    //      remark
    // ====================================
    // When T is number:
    // When encountering a row with no numbers, 0 should be injected.
    // 
    template<typename T = std::string>
    std::vector<T> read_file_lines(
        const std::filesystem::path& path
    )
    {
        std::ifstream file(path);

        std::vector<T> result;

        std::string line;

        // ====================================
        // First line (UTF-8 BOM handling)
        // ====================================

        if (std::getline(file, line))
        {
            if (
                line.size() >= 3 &&
                static_cast<unsigned char>(line[0]) == 0xEF &&
                static_cast<unsigned char>(line[1]) == 0xBB &&
                static_cast<unsigned char>(line[2]) == 0xBF
                )
            {
                line.erase(0, 3);
            }

            if constexpr (std::same_as<T, std::string>)
            {
                result.push_back(std::move(line));
            }
            else
            {
                std::stringstream ss(line);

                T value{};

                ss >> value;

                result.push_back(value);
            }
        }

        // ====================================
        // Remaining lines
        // ====================================

        while (std::getline(file, line))
        {
            if constexpr (std::same_as<T, std::string>)
            {
                result.push_back(std::move(line));
            }
            else
            {
                std::stringstream ss(line);

                T value{};

                ss >> value;

                result.push_back(value);
            }
        }

        return result;
    }

}