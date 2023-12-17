/// @func ToolboxScriptBuilder(parser)
/// @desc A tool for collecting and building the toolbox script data, as parsed by the related ToolboxScriptParser.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser using the builder.
function ToolboxScriptBuilder(_parser) constructor {
    script_parser = _parser;
    script_name = _parser.script_name;
    
    is_script_built = false;
    read_regions = [];
    current_region_name = undefined;
    read_functions = [];
    
    static ensure_not_built = function() {
        if (is_script_built) {
            throw $"Cannot perform any script builder operations after the script data has been already built.";
        }
    }
    
    // ------------------
    // Functions handling
    // ------------------
    
    static add_function = function(_function) {
        ensure_not_built();
        
        if (array_length(read_regions) > 0 && is_undefined(current_region_name)) {
            throw $"Cannot add function '{_function.name}' outside of any region after some regions were read. A script must either have no regions or have every function inside a region.";
        }
        
        array_push(read_functions, _function);
    }
    
    // ----------------
    // Regions handling
    // ----------------
    
    static begin_region = function(_name) {
        ensure_not_built();
        
        if (!is_undefined(current_region_name)) {
            throw $"Cannot begin region '{_name}' within another region '{current_region_name}'.";
        }
        
        if (array_length(read_functions) > 0) {
            throw $"Cannot begin region '{_name}' after reading out-of-region functions. A script must either have no regions or have every function inside a region.";
        }
        
        current_region_name = _name;
    }
    
    static end_region = function() {
        ensure_not_built();
        
        if (is_undefined(current_region_name)) {
            throw $"Cannot end region that was never started in the first place.";
        }
        
        if (array_length(read_functions) == 0) {
            script_parser.warn($"Region '{current_region_name}' has no functions.");
        }
        
        array_push(read_regions, ToolboxRegion.create_named(current_region_name, read_functions));
        
        current_region_name = undefined;
        read_functions = [];
    }
    
    // ---------------
    // Script building
    // ---------------
    
    static build_script = function() {
        ensure_not_built();
        
        if (!is_undefined(current_region_name)) {
            throw $"No matching #endregion directive found for '{current_region_name}' region.";
        }
        
        if (array_length(read_functions) > 0) {
            // functions were read outside of a region, so they belong to the anonymous region
            array_push(read_regions, ToolboxRegion.create_anonymous(read_functions));
        }
        
        if (array_length(read_regions) == 0) {
            script_parser.warn($"Script has no functions or regions.");
        }
        
        is_script_built = true;
        return new ToolboxScript(script_name, read_regions);
    }
}
