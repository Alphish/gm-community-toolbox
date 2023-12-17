/// @func GmlArgument(name,default)
/// @desc A structure storing GML argument data for the given Toolbox function.
/// @arg {String} name                  The argument name.
/// @arg {String,Undefined} default     The argument default value.
function GmlArgument(_name, _default) constructor {
    if (is_undefined(_name))
        return;
    
    name = _name;
    default_value = _default;
    has_default = !is_undefined(default_value);
    
    is_valid = name != "<error>";
    
    // parsing the argument information from the GML function signature
    static parse = function(_parser, _str) {
        var _name = string_before(_str, "=") ?? _str;
        _name = string_trim(_name);
        
        // stripping the starting underscore
        if (!string_starts_with(_name, "_")) {
            _parser.warn($"GML function argument name '{_name}' doesn't start with an underscore.");
            return new GmlArgument("<error>", undefined)
        }
        
        _name = string_delete(_name, 1, 1);
        
        // reading the default value, if any
        var _default = string_after(_str, "=");
        _default = is_string(_default) ? string_trim(_default) : undefined;
        
        // returning the argument information
        return new GmlArgument(_name, _default);
    }
}

/// feather ignore GM1041
var _static_init = new GmlArgument(undefined, undefined);
