/// @func array_max(array)
/// @desc Returns the highest number from the array, or 0 if the array is empty.
/// @arg {Array<Real>} array
/// @returns {Real}
function array_max(_array) {
    return script_execute_ext(max, _array);
} 

/// @func array_min(array)
/// @desc Returns the lowest number from the array, or 0 if the array is empty.
/// @arg {Array<Real>} array
/// @returns {Real}
function array_min(_array) {
    return script_execute_ext(min, _array);
}

/// @func array_mean(array)
/// @desc Returns the average value of the numbers in the array, or 0 if the array is empty.
/// @arg {Array<Real>} array
/// @returns {Real}
function array_mean(_array) {
    return script_execute_ext(mean, _array);
}

/// @func array_median(array)
/// @desc Returns the middle number from the array, or 0 if the array is empty. Given an even items count, returns the larger of two middle numbers.
/// @arg {Array<Real>} array
/// @returns {Real}
function array_median(_array) {
    return script_execute_ext(median, _array);
}

/// @func array_sum(array)
/// @desc Returns the sum of numbers from the array.
/// @arg {Array<Real>} array
/// @returns {Real}
function array_sum(_array) {
    return array_reduce(_array, function(_previous, _current) {return _previous + _current;});
}
