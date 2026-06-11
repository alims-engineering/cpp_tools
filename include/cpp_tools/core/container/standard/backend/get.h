#pragma once

#include <cstddef>

namespace cpp_tools::core::container::standard::backend {

    template<class Container>
    constexpr decltype(auto) get(Container& c, std::size_t i) noexcept(noexcept(c[i])) {
        return c[i];
    }

    template<class Container>
    constexpr decltype(auto) get(const Container& c, std::size_t i) noexcept(noexcept(c[i])) {
        return c[i];
    }

    template<class T, std::size_t N>
    constexpr decltype(auto) get(T(&arr)[N], std::size_t i) noexcept {
        return arr[i];
    }

    template<class T, std::size_t N>
    constexpr decltype(auto) get(const T(&arr)[N], std::size_t i) noexcept{
        return arr[i];
    }
}