#pragma once


#include <string>


namespace cpptools::core::string::function {

    inline void trim(std::string& s) {
        const auto first = s.find_first_not_of(" \t\n\r");
        if (first == std::string::npos) {
            s.clear();
            return;
        }
        const auto last = s.find_last_not_of(" \t\n\r");
        s = s.substr(first, last - first + 1);
    }
}