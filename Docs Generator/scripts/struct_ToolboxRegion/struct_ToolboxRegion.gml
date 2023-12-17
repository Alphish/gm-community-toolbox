/// @func ToolboxRegion(name,functions)
/// @desc A structure representing a region within a Community Toolbox script.
/// @arg {String,Undefined} name                        The region name, or undefined if it's a script-wide pseudo-region.
/// @arg {Array<Struct.ToolboxFunction> functions       The functions contained within the region.
function ToolboxRegion(_name, _functions) constructor {
    if (is_undefined(_functions))
        exit;
    
    name = _name;
    is_anonymous = is_undefined(name);
    functions = _functions;
    
    static create_anonymous = function(_functions) {
        return new ToolboxRegion(undefined, _functions);
    }
    
    static create_named = function(_name, _functions) {
        return new ToolboxRegion(_name, _functions);
    }
}

var _static_init = new ToolboxRegion(undefined, undefined);
