/// @func keyname(of)
/// @desc Turns the given key into a valid reference item key name.
/// @arg {String} str       The string to normalize into the key name.
/// @returns {String,Undefined}
function keyname_of(_str) {
    _str = string_trim(_str);
    if (is_undefined(_str) || _str == "")
        return undefined;
    
    var _left = string_trim(string_before(_str, ":") ?? _str);
    var _right = string_trim(string_after(_str, ":") ?? "");
    return _right != "" ? _left + ":" + _right : _left;
}
