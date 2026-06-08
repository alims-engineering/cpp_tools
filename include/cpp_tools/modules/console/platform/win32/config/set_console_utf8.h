#pragma once

#ifdef _WIN32
#   define NOMINMAX
#   include <windows.h>
#endif

namespace cpptools::modules::console::platform::win32 {

    inline void set_console_utf8() {
        SetConsoleOutputCP(CP_UTF8);
        SetConsoleCP(CP_UTF8);
    }

}
