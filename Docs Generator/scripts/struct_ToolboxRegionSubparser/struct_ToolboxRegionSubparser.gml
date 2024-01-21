/// @func ToolboxRegionSubparser(parser)
/// @desc A tool for parsing toolbox script region boundaries.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser using the subparser.
function ToolboxRegionSubparser(_parser) constructor {
    script_parser = _parser;
    script_scanner = _parser.script_scanner;
    
    current_region = undefined;
    inner_depth = 0;
    
    static peeks_begin_region = function() {
        return script_scanner.peeks_prefix("#region");
    }
    
    static begin_region = function() {
        var _line = script_scanner.get_line_number();
        var _name = script_scanner.read_line_after_prefix("#region");
        if (is_undefined(current_region)) {
            // no unclosed regions or out-of-region functions before this region
            current_region = ToolboxRegion.create_named(script_parser.script, _name, _line);
        } else if (current_region.is_anonymous) {
            // there are out-of-region functions immediately before this region
            script_parser.fail($"Cannot mix in-region and out-of-region functions in the same script.");
            current_region = ToolboxRegion.create_named(script_parser.script, _name, _line);
        } else {
            // there is an unclosed region enclosing the new region
            script_parser.fail($"Cannot begin a region '{_name}' within another region '{current_region.name}'.");
            inner_depth++;
        }
    }
    
    static peeks_end_region = function() {
        return script_scanner.peeks_prefix("#endregion");
    }
    
    static end_region = function() {
        script_scanner.read_line_after_prefix("#endregion");
        if (inner_depth > 0) {
            inner_depth--;
        } else if (!is_undefined(current_region)) {
            current_region = undefined;
        } else {
            script_parser.fail($"Cannot end a region when all the regions have been closed.");
        }
    }
    
    static ensure_closed_regions = function() {
        if (!is_undefined(current_region) && !current_region.is_anonymous)
            script_parser.fail($"Region '{current_region.name}' wasn't been closed.");
    }
    
    static get_region_for_function = function() {
        if (is_undefined(current_region)) {
            if (script_parser.script.has_regions) {
                script_parser.fail($"Cannot mix in-region and out-of-region functions in the same script.");
            }
            
            current_region = ToolboxRegion.create_anonymous(script_parser.script);
        }
        
        return current_region;
    }
}
