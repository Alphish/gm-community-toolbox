/// @func ToolboxScriptParser(scriptdir)
/// @desc A tool for parsing Toolbox GML script contents into in-memory script data.
/// @arg {String} scriptdir     The directory where the script to parse is.
function ToolboxScriptParser(_scriptdir) constructor {
    script_directory = _scriptdir;
    gml_path = file_find_single(script_directory, "*.gml", fa_none);
    script_name = string_between_last(gml_path, "utils_CommunityToolbox", ".gml");
    
    toolbox_script = undefined;
    
    // setting up utilities for script contents processing
    script_lines = file_read_all_lines(gml_path);
    script_scanner = new ToolboxScriptScanner(script_lines);
    script_builder = new ToolboxScriptBuilder(self);
    region_subparser = new ToolboxRegionSubparser(self);
    function_subparser = new ToolboxFunctionSubparser(self);
    
    // processing the script, step by step
    static load_step = function() {
        script_scanner.skip_empty_lines();
        if (script_scanner.is_at_end()) {
            toolbox_script = script_builder.build_script();
            return true; // it's finished now
        }
        
        if (region_subparser.peeks_begin_region()) {
            region_subparser.begin_region();
        } else if (region_subparser.peeks_end_region()) {
            region_subparser.end_region();
        } else if (function_subparser.peeks_function()) {
            var _function = function_subparser.read_function();
            script_builder.add_function(_function);
        } else {
            throw $"Cannot process line:\n{script_scanner.current_line}";
        }
        return false;
    }
    
    // warning about various problems found throughout the parsing
    static warn = function(_message) {
        var _line = script_scanner.get_line_number();
        var _warning = $"{script_name} at line {_line}:\n{_message}";
        ctrl_Generator.log_warning(_warning);
    }
}
