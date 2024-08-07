/// @func JsdocFunctionSignature(name,arguments,line)
/// @desc A structure storing GML function signature data for the given Toolbox function.
/// @arg {String} name                              The function name.
/// @arg {Array<Struct.GmlArgument} arguments       The arguments passed into the function.
/// @arg {Real} line                                The line in the script at which the function is defined.
function GmlFunctionSignature(_name, _arguments, _line) constructor {
    if (is_undefined(_line))
        return;
    
    line = _line;
    name = _name;
    arguments = _arguments;
    
    is_valid = name != "<error>" && array_all(arguments, function (_arg) { return _arg.is_valid; });
    
    // parsing the function signature from the GML function definition
    static parse = function(_parser, _line_number, _line) {
        var _name = string_before(_line, "(");
        var _args_string = string_between(_line, "(", ")");
        
        // could not parse signature in the first place
        if (is_undefined(_name) || is_undefined(_args_string)) {
            _parser.fail($"The GML function signature '{_line}' doesn't have open and close parentheses.");
            return new GmlFunctionSignature("<error>", []);
        }
        
        // handling function without arguments
        if (string_trim(_args_string) == "")
            return new GmlFunctionSignature(_name, []);
        
        // handling function with arguments
        var _arg_names = string_split(_args_string, ",");
        var _args = array_map(_arg_names, method({ script_parser: _parser }, function(_arg) {
            return GmlArgument.parse(script_parser, _arg);
        }));
        return new GmlFunctionSignature(_name, _args, _line_number);
    }
}

/// feather ignore GM1041
var _static_init = new GmlFunctionSignature(undefined, undefined, undefined);
