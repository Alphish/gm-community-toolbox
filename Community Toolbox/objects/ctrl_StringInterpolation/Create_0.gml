template = "Hello, {greetee}!";
values = { greetee: "world" };
evaluator = struct_get;
output = "";

case_insensitive = function(_values, _placeholder) {
    var _keys = struct_get_names(_values);
    for (var i = 0; i < array_length(_keys); i++) {
        var _key = _keys[i];
        if (string_lower(_key) == string_lower(_placeholder))
            return struct_get(_values, _key);
    }
    return undefined;
}

upper_value = function(_values, _placeholder) {
    var _value = struct_get(_values, _placeholder);
    if (is_undefined(_value))
        return undefined;
    else
        return string_upper(_value);
}
