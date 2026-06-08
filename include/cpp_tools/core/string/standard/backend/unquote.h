#pragma once

#include <string>

namespace cpp_tools::core::string::standard::backend {

    inline void unquote(std::string& s) {
        if (s.size() >= 2 &&
            s.front() == '"' &&
            s.back() == '"') {
            s = s.substr(1, s.size() - 2);
        }
    }

}