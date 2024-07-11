/// @func JsdocArgument(name,optional,datatype,description)
/// @desc A structure storing JSDoc argument data for the given Toolbox function, whether read from the @func annotation signature or the @arg annotation details.
/// @arg {String} name                      The argument name.
/// @arg {Bool} optional                    Whether the argument is marked as optional or not.
/// @arg {String,Undefined} datatype        The argument data type.
/// @arg {String,Undefined} description     The argument description.
function JsdocArgument(_name, _optional, _datatype, _description) constructor {
    if (is_undefined(_name))
        return _name;
    
    name = _name;
    is_optional = _optional;
    datatype = _datatype;
    description = _description;
    
    is_valid = name != "<error>";
    
    // parsing an argument summary from the @func annotation signature
    static parse_from_signature_argument = function(_segment) {
        var _name = string_trim(_segment);
        var _optional = false;
        
        if (string_starts_with(_name, "[") && string_ends_with(_name, "]")) {
            _name = string_copy(_name, 2, string_length(_name) - 2);
            _optional = true;
        }
        
        return new JsdocArgument(_name, _optional, undefined, undefined);
    }
    
    // parsing argument details from the @arg annotation
    static parse_from_argument_jsdoc = function(_parser, _line, _rest) {
        var _datatype = string_between(_line, "{", "}");
        if (is_undefined(_datatype)) {
            _parser.fail($"The function argument definition '{_line}' doesn't have a datatype.");
            return new ToolboxFunctionArgument("<error>", false, undefined, undefined);
        }
        
        var _name_and_description = string_trim(string_after(_line, "}"));
        var _name = string_before(_name_and_description, " ") ?? _name_and_description;
        var _optional = false;
        if (string_starts_with(_name, "[") && string_ends_with(_name, "]")) {
            _name = string_copy(_name, 2, string_length(_name) - 2);
            _optional = true;
        }
        
        var _description = string_trim(string_after(_name_and_description, " ")) ?? undefined;
        _description = !is_undefined(_description) ? _description + _rest : string_trim(_rest);
        if (_description == "")
            _parser.fail($"The function argument definition '{_line}' doesn't have a description.");
        
        return new JsdocArgument(_name, _optional, _datatype, _description);
    }
}

/// feather ignore GM1041
var _static_init = new JsdocArgument(undefined, false, undefined, undefined);
