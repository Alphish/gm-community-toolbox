/// @func ToolboxFunction(name,description,arguments,returns,line)
/// @desc A structure representing a single Community Toolbox function.
/// @arg {Struct.ToolboxRegion} region                  The region the function belongs to.
/// @arg {String} name                                  The function name.
/// @arg {String} description                           The function description.
/// @arg {Array<Struct.ToolboxArgument> arguments       The arguments passed into the function.
/// @arg {String,Undefined} returns                     The return type of the function, if any.
/// @arg {Real} line                                    The line in the script at which the function is defined.
function ToolboxFunction(_region, _name, _description, _arguments, _returns, _line) constructor {
    type = "func";
    name = _name;
    keyname = string_lower(name);
    
    description = _description;
    arguments = _arguments;
    return_type = _returns;
    line = _line;
    
    region = _region;
    array_push(region.functions, self);
}
