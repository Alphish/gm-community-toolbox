#region Basic operations

/// @func array_empty(array)
/// @desc Checks if the given array has no items.
/// @arg {Array} array          The array to check.
/// @returns {Bool}
function array_empty(_array) {
    gml_pragma("forceinline");
    return array_length(_array) == 0;
}

/// @func array_clear(array)
/// @desc Removes all items from the array.
/// @arg {Array} array          The array to clear.
function array_clear(_array) {
    gml_pragma("forceinline");
    array_resize(_array, 0);
}

/// @func array_push_ext(dest,source,[offset],[length])
/// @desc Pushes items from one array at the end of another array.
/// @arg {Array} dest           The destination array to push the items to.
/// @arg {Array} source         The source array with the items to push.
/// @arg {Real} [offset]        The offset of the source array to start taking items from.
/// @arg {Real} [length]        The length of the source array subsection to push.
function array_push_ext(_dest, _source, _offset = 0, _length = undefined) {
    var _source_length = array_length(_source);
    _length ??= _source_length;
    var _from = _offset >= 0 ? _offset : _source_length + _offset;
    var _to = clamp(_from + _length, -1, _source_length);
    if ((_from < 0 && _to <= 0) || (_from >= _source_length && _to >= _source_length - 1))
        return;
    
    _from = clamp(_from, 0, _source_length - 1);
    
    array_copy(_dest, array_length(_dest), _source, _from, _to - _from);
}

/// @func array_insert_ext(dest,index,source,[offset],[length])
/// @desc Inserts items from one array into another array.
/// @arg {Array} dest           The destination array to insert the items into.
/// @arg {Real} index           The index in the destination array where the items should be inserted.
/// @arg {Array} source         The source array with the items to insert.
/// @arg {Real} [offset]        The offset of the source array to start taking items from.
/// @arg {Real} [length]        The length of the source array subsection to insert.
function array_insert_ext(_dest, _index, _source, _offset = 0, _length = undefined) {
    var _source_length = array_length(_source);
    _length ??= _source_length;
    var _from = _offset >= 0 ? _offset : _source_length + _offset;
    var _to = clamp(_from + _length, -1, _source_length);
    if ((_from < 0 && _to <= 0) || (_from >= _source_length && _to >= _source_length - 1))
        return;
    
    _from = clamp(_from, 0, _source_length - 1);
    var _count = abs(_to - _from);
    
    var _dest_length = array_length(_dest);
    if (_index < 0)
        _index = max(_dest_length + _index, 0);
    
    // the loop here is to ensure the destination array items are moved forward starting from the latest one
    // to prevent earlier items overwriting the later items to be copied, corrupting the data
    // I can't guarantee array_copy within the same array won't cause this sort of corruption
    // so I don't use it here
    array_resize(_dest, _dest_length + _count);
    for (var i = _dest_length - 1; i >= _index; i--) {
        _dest[i + _count] = _dest[i];
    }
    
    array_copy(_dest, _index, _source, _from, _to - _from);
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
