#pragma once

#include <string>

namespace cpp_tools::core::string::standard::backend {

    inline void trim_left(std::string& s) {
        const auto pos = s.find_first_not_of(" \t\n\r");
        if (pos == std::string::npos) {
            s.clear();
            return;
        }
        s.erase(0, pos);
    }

} // namespace end
