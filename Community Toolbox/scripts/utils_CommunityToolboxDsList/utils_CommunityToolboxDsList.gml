/// @func ds_list_create_from_array(array)
/// @desc Creates a new DS list with items from the given array.
/// @arg {Array} array      The array to get the items from.
/// @returns {Id.DsList}
function ds_list_create_from_array(_array) {
    var _list = ds_list_create();
    ds_list_add_from_array(_list, _array);
    return _list;
}

/// @func ds_list_add_from_array(list,array)
/// @desc Adds items from the given array to the given DS list.
/// @arg {Id.DsList} list       The list to add the items to.
/// @arg {Array} array          The array to get the items from.
function ds_list_add_from_array(_list, _array) {
    var _length = array_length(_array);
    for (var i = 0; i < _length; i++) {
        ds_list_add(_list, _array[i]);
    }
}

/// @func ds_list_to_array(list)
/// @desc Creates a new array with items from the given DS list.
/// @arg {Id.DsList} list       The list to get the items from.
/// @returns {Array}
function ds_list_to_array(_list) {
    var _size = ds_list_size(_list);
    var _array = array_create(_size);
    for (var i = 0; i < _size; i++) {
        _array[i] = _list[| i];
    }
    return _array;
}

/// @func ds_list_add_to_array(list,array)
/// @desc Adds items from the given given DS list to the given array.
/// @arg {Id.DsList} list       The list to get the items from.
/// @arg {Array} array          The array to add the items to.
function ds_list_add_to_array(_list, _array) {
    var _offset = array_length(_array);
    var _size = ds_list_size(_list);
    array_resize(_array, _offset + _size);
    
    for (var i = 0; i < _size; i++) {
        _array[_offset + i] = _list[| i];
    }
}
