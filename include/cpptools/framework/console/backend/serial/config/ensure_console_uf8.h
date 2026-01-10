#pragma once

#include <mutex>

#ifdef _WIN32
#   define NOMINMAX
#   include <windows.h>
#endif

namespace cpptools::framework::console::backend::serial::config {

    inline void ensure_console_utf8() {
#ifdef _WIN32
        static std::once_flag flag;
        std::call_once(flag, [] {
            SetConsoleOutputCP(CP_UTF8);
            SetConsoleCP(CP_UTF8);
            });
#endif
    }

} // namespace cpptools::framework::console::backend::serial::config
