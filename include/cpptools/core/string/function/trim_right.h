#pragma once

#include <string>

namespace cpptools::core::string::function {

    inline void trim_right(std::string& s) {
        const auto pos = s.find_last_not_of(" \t\n\r");
        if (pos == std::string::npos) {
            s.clear();
            return;
        }
        s.erase(pos + 1);
    }

} // namespace
