#region Basic operations

/// @func array_empty(array)
/// @desc Checks if the given array has no items.
/// @arg {Array} array          The array to check.
/// @returns {Bool}
function array_empty(_array) {
    return array_length(_array) == 0;
}

/// @func array_clear(array)
/// @desc Removes all items from the array.
/// @arg {Array} array          The array to clear.
function array_clear(_array) {
    array_resize(_array, 0);
}

#endregion

#region Array-wide maths

/// @func array_max(array,[offset],[length])
/// @desc Returns the highest number from the array or its subsection. If the array/subsection is empty, 0 is returned.
/// @arg {Array<Real>} array    The array to get the maximum value of.
/// @arg {Real} [offset]        The starting index of the subsection (for a negative offset, it will count from array end).
/// @arg {Real} [length]        The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Real}
function array_max(_array, _offset = 0, _length = undefined) {
    // resolving the offset and length
    var _arrlength = array_length(_array);
    _length ??= _arrlength;
    
    if (_offset < 0)
        _offset = max(_arrlength + _offset, 0);
    
    if (_length < 0) {
        _length = min(_offset + 1, -_length);
        _offset -= _length - 1;
    }
    
    _length = min(_arrlength - _offset, _length);
    if (_length <= 0)
        return 0;
    
    // performing the actual calculation
    if (_length <= 10000)
        return script_execute_ext(max, _array, _offset, _length);
    
    var _max = -infinity;
    for (var i = 0; i < _length; i += 10000) {
        var _partial_max = script_execute_ext(max, _array, _offset + i, min(10000, _length - i));
        _max = max(_max, _partial_max);
    }
    return _max;
} 

/// @func array_min(array,[offset],[length])
/// @desc Returns the lowest number from the array or its subsection. If the array/subsection is empty, 0 is returned.
/// @arg {Array<Real>} array    The array to get the minimum value of.
/// @arg {Real} [offset]        The starting index of the subsection (for a negative offset, it will count from array end).
/// @arg {Real} [length]        The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Real}
function array_min(_array, _offset = 0, _length = undefined) {
    // resolving the offset and length
    var _arrlength = array_length(_array);
    _length ??= _arrlength;
    
    if (_offset < 0)
        _offset = max(_arrlength + _offset, 0);
    
    if (_length < 0) {
        _length = min(_offset + 1, -_length);
        _offset -= _length - 1;
    }
    
    _length = min(_arrlength - _offset, _length);
    if (_length <= 0)
        return 0;
    
    // performing the actual calculation
    if (_length <= 10000)
        return script_execute_ext(min, _array, _offset, _length);
    
    var _min = +infinity;
    for (var i = 0; i < _length; i += 10000) {
        var _partial_max = script_execute_ext(min, _array, _offset + i, min(10000, _length - i));
        _min = min(_min, _partial_max);
    }
    return _min;
}

/// @func array_mean(array,[offset],[length])
/// @desc Returns the average value of numbers in the array or its subsection. If the array/subsection is empty, 0 is returned.
/// @arg {Array<Real>} array    The array to get the mean value of.
/// @arg {Real} [offset]        The starting index of the subsection (for a negative offset, it will count from array end).
/// @arg {Real} [length]        The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Real}
function array_mean(_array, _offset = 0, _length = undefined) {
    // resolving the offset and length
    var _arrlength = array_length(_array);
    _length ??= _arrlength;
    
    if (_offset < 0)
        _offset = max(_arrlength + _offset, 0);
    
    if (_length < 0) {
        _length = min(_offset + 1, -_length);
        _offset -= _length - 1;
    }
    
    _length = min(_arrlength - _offset, _length);
    if (_length <= 0)
        return 0;
    
    // performing the actual calculation
    if (_length <= 10000)
        return script_execute_ext(mean, _array, _offset, _length);
    
    return array_sum(_array, _offset, _length) / _length;
}

/// @func array_median(array,[offset],[length])
/// @desc Returns the middle number from the array or its subsection. If two middle numbers are present, the higher is returned. If the array/subsection is empty, 0 is returned.
/// @arg {Array<Real>} array    The array to get the median value of.
/// @arg {Real} [offset]        The starting index of the subsection (for a negative offset, it will count from array end).
/// @arg {Real} [length]        The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Real}
function array_median(_array, _offset = 0, _length = undefined) {
    // resolving the offset and length
    var _arrlength = array_length(_array);
    _length ??= _arrlength;
    
    if (_offset < 0)
        _offset = max(_arrlength + _offset, 0);
    
    if (_length < 0) {
        _length = min(_offset + 1, -_length);
        _offset -= _length - 1;
    }
    
    _length = min(_arrlength - _offset, _length);
    if (_length <= 0)
        return 0;
    
    // performing the actual calculation
    if (_length <= 10000) {
        return script_execute_ext(median, _array, _offset, _length);
    } else {
        // I know there is this neat "median of medians" algorithm that can find the median in O(n) time
        // thus making it seemingly preferable for larger datasets than array_sorting
        // but the algorithm is pretty complex, and requires lots of swaps along the way
        // so the overhead of running lots of GML might outweigh the O(n) benefits, maybe except for the most extreme cases
        var _new_array = array_create(_length, 0);
        array_copy(_new_array, 0, _array, _offset, _length);
        array_sort(_new_array, true);
        return _new_array[_length div 2];
    }
}

/// @func array_sum(array,[offset],[length])
/// @desc Returns the sum of numbers in the array or its subsection. If the array/subsection is empty, 0 is returned.
/// @arg {Array<Real>} array    The array to get the sum of.
/// @arg {Real} [offset]        The starting index of the subsection (for a negative offset, it will count from array end).
/// @arg {Real} [length]        The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Real}
function array_sum(_array, _offset = 0, _length = undefined) {
    // resolving the offset and length
    var _arrlength = array_length(_array);
    _length ??= _arrlength;
    
    if (_offset < 0)
        _offset = max(_arrlength + _offset, 0);
    
    if (_length < 0) {
        _length = min(_offset + 1, -_length);
        _offset -= _length - 1;
    }
    
    _length = min(_arrlength - _offset, _length);
    if (_length <= 0)
        return 0;
    
    // performing the actual calculation
    if (code_is_compiled()) {
        // on YYC, basic addition loop is faster
        var _total = 0;
        for (var i = _offset + _length - 1; i >= _offset; i--) {
            _total += _array[i];
        }
        return _total;
    } else {
        // on VM, array_reduce is faster instead
        return array_reduce(_array, function(_previous, _current) { return _previous + _current; }, 0, _offset, _length);
    }
}

#endregion

#region Random elements

/// @func array_get_random(array,[offset],[length])
/// @desc Returns a random element from the array or its subsection. If the array/subsection is empty, undefined is returned.
/// @arg {Array} array          The array to get the random element from.
/// @arg {Real} [offset]        The starting index of the subsection (for a negative offset, it will count from array end).
/// @arg {Real} [length]        The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Any}
function array_get_random(_array, _offset = 0, _length = undefined) {
    // resolving the offset and length
    var _arrlength = array_length(_array);
    _length ??= _arrlength;
    
    if (_offset < 0)
        _offset = max(_arrlength + _offset, 0);
    
    if (_length < 0) {
        _length = min(_offset + 1, -_length);
        _offset -= _length - 1;
    }
    
    _length = min(_arrlength - _offset, _length);
    if (_length <= 0)
        return undefined;
    
    // getting the random value	
    var _index = irandom_range(_offset, _offset + _length - 1);
    return _array[_index];
}


/// @func array_pop_random(array,[offset],[length])
/// @desc Pops a random element from the array or its subsection. If the array/subsection is empty, undefined is returned.
/// @arg {Array} array          The array to pop the random element from.
/// @arg {Real} [offset]        The starting index of the subsection (for a negative offset, it will count from array end).
/// @arg {Real} [length]        The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Any}
function array_pop_random(_array, _offset = 0, _length = undefined) {
    // resolving the offset and length
    var _arrlength = array_length(_array);
    _length ??= _arrlength;
    
    if (_offset < 0)
        _offset = max(_arrlength + _offset, 0);
    
    if (_length < 0) {
        _length = min(_offset + 1, -_length);
        _offset -= _length - 1;
    }
    
    _length = min(_arrlength - _offset, _length);
    if (_length <= 0)
        return undefined;
    
    // popping the value
    var _index = irandom_range(_offset, _offset + _length - 1);
    var _element = _array[_index];
    array_delete(_array, _index, 1);
    return _element;
}

#endregion
