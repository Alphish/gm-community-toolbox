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
