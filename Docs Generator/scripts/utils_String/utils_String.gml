/// @func string_contains(str,substr)
/// @desc Checks whether a given string contains the given substring or not.
/// @arg {String} str           The string to check.
/// @arg {String} substr        The substring to find in the string.
/// @returns {Bool}
function string_contains(_str, _substr) {
    return string_pos(_substr, _str) > 0;
}

/// @func string_before(str,substr)
/// @desc Returns a part of the given string before the first occurrence of the given substring, or undefined if the substring isn't found.
/// @arg {String} str           The string to get the part of.
/// @arg {String} substr        The substring to divide the input string by.
/// @returns {String,Undefined}
function string_before(_str, _substr) {
    var _pos = string_pos(_substr, _str);
    return _pos > 0 ? string_copy(_str, 1, _pos - 1) : undefined;
}

/// @func string_after(str,substr)
/// @desc Returns a part of the given string after the first occurrence of the given substring, or undefined if the substring isn't found.
/// @arg {String} str           The string to get the part of.
/// @arg {String} substr        The substring to divide the input string by.
/// @returns {String,Undefined}
function string_after(_str, _substr) {
    var _pos = string_pos(_substr, _str);
    return _pos > 0 ? string_delete(_str, 1, _pos - 1 + string_length(_substr)) : undefined;
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
    
    var _startpos = _leftpos + string_length(_left);
    
    var _rightpos = string_pos_ext(_right, _str, _startpos);
    if (_rightpos < 1)
        return undefined;
    
    return string_copy(_str, _startpos, _rightpos - _startpos);
}

/// @func string_before_last(str,substr)
/// @desc Returns a part of the given string before the last occurrence of the given substring, or undefined if the substring isn't found.
/// @arg {String} str           The string to get the part of.
/// @arg {String} substr        The substring to divide the input string by.
/// @returns {String,Undefined}
function string_before_last(_str, _substr) {
    var _pos = string_last_pos(_substr, _str);
    return _pos > 0 ? string_copy(_str, 1, _pos - 1) : undefined;
}

/// @func string_after_last(str,substr)
/// @desc Returns a part of the given string after the last occurrence of the given substring, or undefined if the substring isn't found.
/// @arg {String} str           The string to get the part of.
/// @arg {String} substr        The substring to divide the input string by.
/// @returns {String,Undefined}
function string_after_last(_str, _substr) {
    var _pos = string_last_pos(_substr, _str);
    return _pos > 0 ? string_delete(_str, 1, _pos - 1 + string_length(_substr)) : undefined;
}

/// @func string_between_last(str,left,right)
/// @desc Returns a part of the given string between the last occurrence of given substrings, or undefined if the substrings weren't found in the given sequence.
/// @arg {String} str           The string to get the part of.
/// @arg {String} left          The substring marking the start of the part to extract.
/// @arg {String} right         The substring marking the end of the part to extract.
/// @returns {String,Undefined}
function string_between_last(_str, _left, _right) {
    var _rightpos = string_last_pos(_right, _str);
    if (_rightpos < 1)
        return undefined;
    
    var _leftpos = string_last_pos_ext(_left, _str, _rightpos - 1);
    if (_leftpos < 1)
        return undefined;
    
    var _startpos = _leftpos + string_length(_left);
    
    return string_copy(_str, _startpos, _rightpos - _startpos);
}

/// @func static_init(func)
/// @desc Runs a given function from the static init context, so that core function logic won't be executed when setting static function variables.
/// @arg {Function} func        The function to initialise the static variables of.
function static_init(_func) {
    static context = { };
    
    with (context) {
        _func();
        
        if (struct_names_count(self) > 0) {
            throw $"The static init context was changed when initialising statics of {script_get_name(_func)}.\n" +
                  $"Use static_init_in_progress() to exit early from the function.";
        }
    }
}

/// @func static_init_in_progress()
/// @desc Checks whether the current logic is processed from the static init context or not. Use it to exit early when initialising static variables.
function static_init_in_progress() {
    return self == static_init.context;
}
