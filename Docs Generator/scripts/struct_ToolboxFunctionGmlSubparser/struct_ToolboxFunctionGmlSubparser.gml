/// @func ToolboxFunctionGmlSubparser(parser)
/// @desc A tool for parsing data of GML sections in Toolbox functions.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser using the subparser.
function ToolboxFunctionGmlSubparser(_parser) constructor {
    script_parser = _parser;
    script_scanner = _parser.script_scanner;
    
    static read_gml_signature = function() {
        var _line_number = script_scanner.get_line_number();
        var _line = read_function_line();
        skip_function_rest();
        return GmlFunctionSignature.parse(script_parser, _line_number, _line);
    }
    
    static read_function_line = function() {
        return script_scanner.read_line_after_prefix("function");
    }
    
    static skip_function_rest = function() {
        while (!script_scanner.is_at_end()) {
            var _reached_function_end = script_scanner.peeks_prefix("}");
            script_scanner.advance();
            if (_reached_function_end)
                break;
        }
    }
}
