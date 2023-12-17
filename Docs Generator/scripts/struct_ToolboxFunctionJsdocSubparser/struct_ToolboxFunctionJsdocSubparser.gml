/// @func ToolboxFunctionJsdocSubparser(parser)
/// @desc A tool for parsing data of JSDoc sections in Toolbox functions.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser using the subparser.
function ToolboxFunctionJsdocSubparser(_parser) constructor {
    script_parser = _parser;
    script_scanner = _parser.script_scanner;
    
    static read_jsdoc = function() {
        var _data_builder = new JsdocAnnotationBuilder(script_parser);
        
        while (peeks_jsdoc_entry()) {
            var _tag = peek_jsdoc_tag();
            var _line = read_jsdoc_line(_tag);
            
            var _normalized_tag = _data_builder.normalize_tag(_tag);
            if (is_undefined(_normalized_tag))
                continue;
            
            switch (_normalized_tag) {
                case "func":
                    var _signature = JsdocFunctionSignature.parse(script_parser, _line);
                    _data_builder.accept_function_signature(_signature);
                    break;
                
                case "desc":
                    var _rest = read_jsdoc_rest();
                    var _description = _line + _rest;
                    _data_builder.accept_description(_description);
                    break;
                
                case "arg":
                    var _rest = read_jsdoc_rest();
                    var _argument = JsdocArgument.parse_from_argument_jsdoc(script_parser, _line, _rest);
                    _data_builder.accept_argument(_argument);
                    break;
                
                case "returns":
                    var _return_type = string_between(_line, "{", "}");
                    if (is_undefined(_return_type)) {
                        script_parser.warn($"The function return annotation '{_line}' doesn't have a datatype.");
                        _return_type = "<error>"; 
                    }
                    _data_builder.accept_return_type(_return_type);
                    break;
            }
        }
        
        return _data_builder.build();
    }
    
    // ------------------
    // Scanning utilities
    // ------------------
    
    static peeks_jsdoc_entry = function() {
        return script_scanner.peeks_prefix("/// @") && !script_scanner.peeks_prefix("/// @ ");
    }
    
    static peek_jsdoc_tag = function() {
        return string_between(script_scanner.current_line, "@", " ") ?? string_after(script_scanner.current_line, "@");
    }
    
    static read_jsdoc_line = function(_tag) {
        return script_scanner.read_line_after_prefix("/// @" + _tag);
    }
    
    static read_jsdoc_rest = function() {
        var _rest = "";
        while (script_scanner.peeks_prefix("/// @ ")) {
            _rest += "\n" + script_scanner.read_line_after_prefix("/// @ ");
        }
        return _rest;
    }
}