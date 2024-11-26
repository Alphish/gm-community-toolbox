/// @func ToolboxArgument(datatype,name,optional,default,description)
/// @desc A structure representing a Community Toolbox function argument.
/// @arg {String} datatype              The argument data type.
/// @arg {String} name                  The argument name
/// @arg {Bool} optional                Whether the argument is optional or not.
/// @arg {String,Undefined} default     The argument default value, if any.
/// @arg {String} description           The argument description.
function ToolboxArgument(_datatype, _name, _optional, _default, _description) constructor {
    datatype = _datatype;
    name = _name;
    keyname = string_lower(name);
    
    is_optional = _optional;
    default_value = _default;
    description = _description;
}
