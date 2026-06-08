#pragma once

#include <mutex>

#include <cpptools/modules/console/platform/win32/config/set_console_utf8.h>

namespace cpptools::modules::console::backend::serial {

    inline void ensure_console_utf8() {
        namespace c_win32 = cpptools::modules::console::platform::win32;

#ifdef _WIN32
        static std::once_flag flag;
        std::call_once(flag, [] {
            c_win32::set_console_utf8();
            });
#elif defined(__linux__)
        // no-op
#else
        // fallback
#endif
    }

}
