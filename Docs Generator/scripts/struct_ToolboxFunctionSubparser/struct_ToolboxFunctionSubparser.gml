/// @func ToolboxFunctionSubparser(parser)
/// @desc A tool for parsing individual functions data from the Toolbox script.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser using the subparser.
function ToolboxFunctionSubparser(_parser) constructor {
    script_parser = _parser;
    
    jsdoc_subparser = new ToolboxFunctionJsdocSubparser(_parser);
    gml_subparser = new ToolboxFunctionGmlSubparser(_parser);
    function_resolver = new ToolboxFunctionResolver(_parser);
    
    static peeks_function = function() {
        return jsdoc_subparser.peeks_jsdoc_entry();
    }
    
    static read_function = function(_region) {
        var _jsdoc_data = jsdoc_subparser.read_jsdoc();
        var _gml_signature = gml_subparser.read_gml_signature();
        return function_resolver.resolve_toolbox_function(_region, _jsdoc_data, _gml_signature);
    }
}
