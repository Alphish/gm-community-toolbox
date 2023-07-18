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
    var _total = 0;
    for (var i = array_length(_array)-1; i >= 0; --i) {
        _total += _array[i];
    }
    return _total;
}

/// @func       array_get_random(array,[offset],[length])
/// @desc       Returns a random element from the array (or a range within it). If the array is empty or the length is zero it will return undefined.
/// @arg        {Array<Real>}    array       the desired array
/// @arg        {Real}           [offset]    optional 0-based offset to use. By default 0.
/// @arg        {Real}           [length]    optional non-zero length of items to select from, starting from offset. By default array_length(array).
/// @returns    {Any}            a random item from the array
function array_get_random(_array, _offset=0, _length=array_length(_array)) {
    if (array_length(_array) == 0 || _length == 0) {
        return undefined;
    }
    
    var _n = array_length(_array);
    
    if (_offset < 0) {
        _offset = max(0, _n+_offset);
    }
    else {
        _offset = min(_offset, _n-1);
    }

    if (_length < 0) {
        _offset = max(0, _offset + _length + 1);
        _length = min(_offset + 1, abs(_length));
    }
    else {
        _length = min(_n-_offset, _length);
    }
    
    var _index = irandom_range(_offset, _offset + _length - 1);
    return _array[_index];
}


/// @func       array_pop_random(array,[offset],[length])
/// @desc       Pops a random element from the array (or a range within it). If the array is empty or the length is zero it will return undefined.
/// @arg        {Array<Real>}    array       the desired array
/// @arg        {Real}           [offset]    optional 0-based offset to use. By default 0.
/// @arg        {Real}           [length]    optional non-zero length of items to select from, starting from offset. By default array_length(array).
/// @returns    {Any}            a random item from the array
function array_pop_random(_array, _offset=0, _length=array_length(_array)) {
    if (array_length(_array) == 0 || _length == 0) {
        return undefined;
    }
    
    var _n = array_length(_array);
    
    if (_offset < 0) {
        _offset = max(0, _n+_offset);
    }
    else {
        _offset = min(_offset, _n-1);
    }

    if (_length < 0) {
        _offset = max(0, _offset + _length + 1);
        _length = min(_offset + 1, abs(_length));
    }
    else {
        _length = min(_n-_offset, _length);
    }
    
    var _index = irandom_range(_offset, _offset + _length - 1);
    var _element = _array[_index];
    array_delete(_array, _index, 1);
    return _element;        
}