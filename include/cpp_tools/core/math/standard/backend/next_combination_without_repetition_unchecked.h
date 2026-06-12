#pragma once

#include <cpp_tools/core.hpp>

namespace cpp_tools::core::math::standard::backend {

	// ====================================
	//		parameters
	// ====================================
	// combination	: Combination state array without repetition.
	// max_value	: Maximum allowed value in the combination. Valid values are in the range [1, max_value].
	//
	// ====================================
	//		remark
	// ====================================
	// It is generally used when size_of_combination (larger than, >) max_value.
	// Because it will stop checking when the combination have all done
	template<class Container, class Integer>
	void next_combination_without_repetition_unchecked(
		Container& combination,
		Integer max_value
	) {
		namespace ct_container = cpp_tools::core::container::standard::backend;

		ct_container::get(combination, 0)++;

		for (Integer y = 0; y < max_value; ++y) {
			if (ct_container::get(combination, y) > max_value - y) {

				ct_container::get(combination, y + 1)++;

				for (Integer y2 = y; y2 >= 0; --y2) {
					ct_container::get(combination, y2)
						= ct_container::get(combination, y2 + 1) + 1;
				}
			}
		}
	}

	// ====================================
	//      parameters
	// ====================================
	// combination      : Combination state array without repetition.
	// max_value        : Maximum allowed value in the combination.
	//                    Valid values are in the range [1, max_value].
	// combination_size : Number of active elements participating in the
	//                    combination generation
	// ====================================
	//		remark
	// ====================================
	// It is generally used when size_of_combination (smaller than or equal to, <=) max_value.
	template<class Container, class Integer>
	void next_combination_without_repetition_unchecked(
		Container& combination,
		Integer max_value,
		Integer combination_size
	) {
		namespace ct_container = cpp_tools::core::container::standard::backend;

		ct_container::get(combination, 0)++;

		for (Integer y = 0; y < combination_size; ++y) {
			if (ct_container::get(combination, y) > max_value - y) {

				ct_container::get(combination, y + 1)++;

				for (Integer y2 = y; y2 >= 0; --y2) {
					ct_container::get(combination, y2)
						= ct_container::get(combination, y2 + 1) + 1;
				}
			}
		}
	}
}
