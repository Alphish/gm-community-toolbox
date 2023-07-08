/// @func array_max(array)
/// @param {Array<Real>} array
/// @desc Returns the max number value from the array.
/// @returns {Real}
function array_max(_array) {
    return script_execute_ext(max, _array);
} 

/// @func array_min(array)
/// @param {Array<Real>} array
/// @desc Returns the min number value from the array.
/// @returns {Real}
function array_min(_array) {
    return script_execute_ext(min, _array);
}

/// @func array_mean(array)
/// @param {Array<Real>} array
/// @desc Adds up all of the numbers from the array, divides them by their array length, and returns that number.
/// @returns {Real}
function array_mean(_array) {
    return script_execute_ext(mean, _array);
}

/// @func array_median(array)
/// @param {Array<Real>} array
/// @desc Returns the middle most number value from the array. 
/// @returns {Real}
function array_median(_array) {
    return script_execute_ext(median, _array);
}

/// @func array_sum(array)
/// @param {Array<Real>} array
/// @desc Returns the sum of numbers from the array. 
/// @returns {Real}
function array_sum(_array) {
    var _total = 0;
    for (var i = array_length(_array)-1; i >= 0; --i) {
        _total += _array[i];
    }
    return _total;
}
