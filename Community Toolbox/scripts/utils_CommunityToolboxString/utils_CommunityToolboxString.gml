/// @func string_contains(str,substr)
/// @desc Checks whether the given string contains the substring or not. Always returns true for an empty substringg.
/// @arg {String} str           The string to find the substring in.
/// @arg {String} substr        The string to check.
/// @returns {Bool}
function string_contains(_str, _substr) {
    if (_substr == "")
        return true;
    
    return string_pos(_substr, _str) > 0;
}

/// @func string_to_char_array(str,[oneindexed])
/// @desc Creates an array of characters from a given string. It may be 0-indexed or 1-indexed (it's 0-indexed by default).
/// @arg {String} str           The string to convert to the array.
/// @arg {Bool} [oneindexed]    Whether the first character should start at index of 0 (false) or index of 1 (true).
/// @returns {Array<String>}
function string_to_char_array(_str, _oneindexed = false) {
    var _result = array_create(string_length(_str) + (_oneindexed ? 1 : 0), "");
    var _foreach_context = { result: _result, offset: _oneindexed ? 0 : -1 };
    string_foreach(_str, method(_foreach_context, function(_char, i) {
        result[i + offset] = _char;
    }));
    return _result;
}
