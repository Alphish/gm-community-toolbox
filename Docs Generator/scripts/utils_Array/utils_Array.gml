/// @func array_flat_map(array,selector)
/// @desc Maps a given array items to related collections, then concatenates the collections together.
/// @arg {Array} array          The array for which mapping and flattening is performed.
/// @arg {Function} selector    The function that maps the main array items into collections.
/// @returns {Array}
function array_flat_map(_array, _selector) {
    var _result = [];
    var _subarrays = array_map(_array, _selector);
    var _subarrays_count = array_length(_subarrays);
    for (var i = 0; i < _subarrays_count; i++) {
        array_copy(_result, array_length(_result), _subarrays[i], 0, array_length(_subarrays[i]));
    }
    return _result;
}

/// @func array_key_by(array,selector)
/// @desc Creates a struct mapping the given array items to keys obtained through the given selector.
/// @arg {Array} array          The array with items to be mapped to their keys.
/// @arg {Function} selector    The function that maps array items to their keys.
/// @returns {Struct}
function array_key_by(_array, _selector) {
    var _context = { result: {}, selector: _selector };
    array_foreach(_array, method(_context, function(_item) {
        var _key = self.selector(_item);
        if (struct_exists(self.result, _key))
            throw $"Duplicate key '{_key}' found when building a map of keyed array items.";
        
        self.result[$ _key] = _item;
    }));
    return _context.result;
}
