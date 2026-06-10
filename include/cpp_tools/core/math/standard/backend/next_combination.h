#pragma once

#include <iostream>


namespace cpp_tools::core::math::standard::backend {

	// ====================================
	//		parameters
	// ====================================
	// combination_array :
	// max_value	: Maximum allowed value in the combination. Start form 1 to max_value
	template<typename Integer = int>
	void next_combination(Integer combination_array[], Integer max_value) {
		combination_array[0]++;

		for (int y = 0; y < max_value; y++) {
			if (combination_array[y] > max_value - y) {
				combination_array[y + 1]++;

				for (int y2 = y; y2 >= 0; y2--) {
					combination_array[y2] = combination_array[y2 + 1] + 1;
				}
			}
		}
	}
}