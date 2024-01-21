/// @func ToolboxRegion(name,functions)
/// @desc A structure representing a region within a Community Toolbox script.
/// @arg {Struct.ToolboxScript} script      The script the region belongs to.
/// @arg {String,Undefined} name            The region name, or undefined if it's a script-wide pseudo-region.
/// @arg {Real,Undefined} line              The line at which the region is defined.
function ToolboxRegion(_script, _name, _line) constructor {
    if (is_undefined(_script))
        exit;
    
    type = "region";
    name = _name;
    keyname = _script.keyname + ":" + string_lower(name);
    is_anonymous = is_undefined(name);
    line = _line;
    
    script = _script;
    array_push(script.regions, self);
    if (!is_anonymous)
        script.has_regions = true;
    
    functions = [];
    
    static create_anonymous = function(_script) {
        return new ToolboxRegion(_script, undefined, undefined);
    }
    
    static create_named = function(_script, _name, _line) {
        return new ToolboxRegion(_script, _name, _line);
    }
}

/// feather ignore GM1041
var _static_init = new ToolboxRegion(undefined, undefined, undefined);
