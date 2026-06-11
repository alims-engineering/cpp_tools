#pragma once

#include <cstddef>


namespace cpp_tools::core::container::standard::backend {

    // ====================================
    //      explanation
    // ====================================
    // ====================================
    //      parameters
    // ====================================
    // container : 
    // 
    template<class Container>
    constexpr auto size(const Container& container) noexcept(noexcept(container.size())) {
        return container.size();
    }

    template<class T, std::size_t N>
    constexpr std::size_t size(const T(&)[N]) noexcept {
        return N;
    }

}