#pragma once

#include <string>

namespace cpptools::core::string::function {

    inline void unquote(std::string& s) {
        if (s.size() >= 2 &&
            s.front() == '"' &&
            s.back() == '"') {
            s = s.substr(1, s.size() - 2);
        }
    }

}