/// @func ToolboxRegionSubparser(parser)
/// @desc A tool for parsing toolbox script region boundaries.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser using the subparser.
function ToolboxRegionSubparser(_parser) constructor {
    script_scanner = _parser.script_scanner;
    script_builder = _parser.script_builder;
    
    static peeks_begin_region = function() {
        return script_scanner.peeks_prefix("#region");
    }
    
    static begin_region = function() {
        var _name = script_scanner.read_line_after_prefix("#region");
        script_builder.begin_region(_name);
    }
    
    static peeks_end_region = function() {
        return script_scanner.peeks_prefix("#endregion");
    }
    
    static end_region = function() {
        script_scanner.read_line_after_prefix("#endregion");
        script_builder.end_region();
    }
}
