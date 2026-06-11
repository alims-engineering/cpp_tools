#pragma once

#include <cstddef>


namespace cpp_tools::core::container::standard::backend {

\
    template<class Container>
    constexpr size_t size(const Container& c) {
        return c.size();
    }

    template<class T, size_t N>
    constexpr size_t size(const T(&)[N]) {
        return N;
    }

    template<class Container>
    constexpr auto& get(const Container& c, size_t i) {
        return c[i];
    }

    template<class T, size_t N>
    constexpr T& get(const T(&arr)[N], size_t i) {
        return arr[i];
    }


} // namespace cpptools::core::traits
