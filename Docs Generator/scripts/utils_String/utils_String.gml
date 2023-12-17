/// @func string_before(str,substr)
/// @desc Returns a part of the given string before the first occurrence of the given substring, or undefined if the substring isn't found.
/// @arg {String} str           The string to get the part of.
/// @arg {String} substr        The substring to divide the input string by.
/// @returns {String,Undefined}
function string_before(_str, _substr) {
    var _pos = string_pos(_substr, _str);
    if (_pos < 1)
        return undefined;
    else
        return string_copy(_str, 1, _pos - 1);
}

/// @func string_after(str,substr)
/// @desc Returns a part of the given string after the first occurrence of the given substring, or undefined if the substring isn't found.
/// @arg {String} str           The string to get the part of.
/// @arg {String} substr        The substring to divide the input string by.
/// @returns {String,Undefined}
function string_after(_str, _substr) {
    var _pos = string_pos(_substr, _str);
    if (_pos < 1)
        return undefined;
    else
        return string_delete(_str, 1, _pos - 1 + string_length(_substr));
}

/// @func string_between(str,left,right)
/// @desc Returns a part of the given string between the given substrings, or undefined if the substrings weren't found in the given sequence.
/// @arg {String} str           The string to get the part of.
/// @arg {String} left          The substring marking the start of the part to extract.
/// @arg {String} right         The substring marking the end of the part to extract.
/// @returns {String,Undefined}
function string_between(_str, _left, _right) {
    var _leftpos = string_pos(_left, _str);
    if (_leftpos < 1)
        return undefined;
    
    var _start = _leftpos + string_length(_left);
    
    var _rightpos = string_pos_ext(_right, _str, _start);
    if (_rightpos < 1)
        return undefined;
    
    return string_copy(_str, _start, _rightpos - _start);
}
