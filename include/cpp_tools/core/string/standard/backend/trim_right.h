#pragma once

#include <string>

namespace cpp_tools::core::string::standard::backend {

    inline void trim_right(std::string& s) {
        const auto pos = s.find_last_not_of(" \t\n\r");
        if (pos == std::string::npos) {
            s.clear();
            return;
        }
        s.erase(pos + 1);
    }

} // cpptools::core::string::function
