#pragma once

#include <cstddef>
#include <type_traits>
#include <utility>

namespace cpp_tools::core::container::standard::traits {

    // ====================================
    //      primary template
    // ====================================
    // ====================================
    //      variables
    // ====================================
    // is_container : True if T is recognized as a container type.
    // dimensions   : Number of nested container dimensions.
    // fixed_size   : True if the container size is known at compile time and cannot change.
    template<typename T, typename = void>
    struct container_traits {

        static constexpr bool is_container = false;

        static constexpr size_t dimensions = 0;

        static constexpr bool fixed_size = false;

    };

    // ====================================
    // C-array
    // ====================================

    template<typename T, size_t N>
    struct container_traits<T[N]> {

        static constexpr bool is_container = true;

        static constexpr size_t dimensions = container_traits<T>::dimensions + 1;

        static constexpr bool fixed_size = true;

        static constexpr size_t static_size = N;

        using value_type = T;

    };

    // ====================================
    // generic container detection
    // ====================================

    template<typename T>
    struct container_traits<
        T,
        std::void_t<
        decltype(std::declval<T>().begin()),
        decltype(std::declval<T>().end())
        >
    > {

        static constexpr bool is_container = true;

        static constexpr size_t dimensions = 1;

        static constexpr bool fixed_size = false;

        using value_type = typename T::value_type;

    };

} // namespace