/// @func ToolboxFunction(name,description,arguments,returns,line)
/// @desc A structure representing a single Community Toolbox function.
/// @arg {String} name                                  The function name.
/// @arg {String} description                           The function description.
/// @arg {Array<Struct.ToolboxArgument> arguments       Data of the arguments passed into the function.
/// @arg {String,Undefined} returns                     The return type of the function, if any.
/// @arg {Real} line                                    The line in the script at which the function is defined.
function ToolboxFunction(_name, _description, _arguments, _returns, _line) constructor {
    name = _name;
    description = _description;
    arguments = _arguments;
    return_type = _returns;
    line = _line;
}
