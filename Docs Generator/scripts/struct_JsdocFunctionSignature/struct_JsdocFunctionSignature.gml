/// @func JsdocFunctionSignature(name,arguments)
/// @desc A structure storing JSDoc function signature for the given Toolbox function, as read from the @func annotation.
/// @arg {String} name                                  The function name.
/// @arg {Array<Struct.JsdocArgument>} arguments        The arguments passed into the function.
function JsdocFunctionSignature(_name, _arguments) constructor {
    if (is_undefined(_name))
        return;
    
    name = _name;
    arguments = _arguments;
    
    is_valid = name != "<error>" && array_all(arguments, function(_arg) { return _arg.is_valid; });
    
    // parsing the function signature from the @func annotation
    static parse = function(_parser, _line) {
        var _name = string_before(_line, "(");
        var _args_string = string_between(_line, "(", ")");
        
        // could not parse signature in the first place
        if (is_undefined(_name) || is_undefined(_args_string)) {
            _parser.fail($"The JSDoc function signature '{_line}' doesn't have open and close parentheses.");
            return new JsdocFunctionSignature("<error>", []);
        }
        
        // handling function without arguments
        if (string_trim(_args_string) == "")
            return new JsdocFunctionSignature(_name, []);
        
        // handling function with arguments
        var _arg_names = string_split(_args_string, ",");
        var _args = array_map(_arg_names, JsdocArgument.parse_from_signature_argument);
        return new JsdocFunctionSignature(_name, _args);
    }
}

/// feather ignore GM1041
var _static_init = new JsdocFunctionSignature(undefined, undefined);
