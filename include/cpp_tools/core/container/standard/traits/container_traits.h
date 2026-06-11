#pragma once

#include <cstddef>
#include <type_traits>
#include <utility>
#include <map>
#include <set>
#include <unordered_map>
#include <unordered_set>

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

        // ---- basic properties ----

        static constexpr bool is_container = false;

        static constexpr size_t dimensions = 0;

        static constexpr bool fixed_size = false;

        // ---- container classification ----
        static constexpr bool is_map = false;       // associative map container
        static constexpr bool is_set = false;       // associative set container
        static constexpr bool is_multi = false;     // allows duplicate keys (multimap/multiset)
        static constexpr bool is_unordered = false; // hash-based unordered container

    };

    // ====================================
    // C-array
    // ====================================

    template<typename T, size_t N>
    struct container_traits<T[N]> {

        // ---- basic properties ----

        static constexpr bool is_container = true;

        static constexpr size_t dimensions = container_traits<T>::dimensions + 1;

        static constexpr bool fixed_size = true;

        //

        static constexpr size_t static_size = N;

        // classification properties (C-arrays are not associative containers)
        static constexpr bool is_map = false;
        static constexpr bool is_set = false;
        static constexpr bool is_multi = false;
        static constexpr bool is_unordered = false;

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

        static constexpr size_t dimensions =
            container_traits<typename T::value_type>::dimensions + 1;

        static constexpr bool fixed_size = false;

        // classification properties default to false (overridden by specializations)

        static constexpr bool is_map = false;
        static constexpr bool is_set = false;
        static constexpr bool is_multi = false;
        static constexpr bool is_unordered = false;

        using value_type = typename T::value_type;

    };

    // ====================================
    //      std::map (ordered, unique keys)
    // ====================================
    template<typename K, typename V, typename C, typename A>
    struct container_traits<std::map<K, V, C, A>> {

        // ---- basic properties ----

        static constexpr bool is_container = true;
        static constexpr size_t dimensions = 1;
        static constexpr bool fixed_size = false;

        static constexpr bool is_map = true;
        static constexpr bool is_set = false;
        static constexpr bool is_multi = false;   // unique keys only
        static constexpr bool is_unordered = false;

        using key_type = K;
        using mapped_type = V;
        using value_type = std::pair<const K, V>;

    };

} // namespace end