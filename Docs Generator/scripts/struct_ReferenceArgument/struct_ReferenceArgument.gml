/// @func ReferenceArgument(fromproject,fromstub)
/// @desc A structure representing a function argument in the merged reference documentation.
/// @arg {Struct.ToolboxArgument} fromproject                   The corresponding argument data from the project function.
/// @arg {Struct.ReferenceArgumentStub,Undefined} fromstub      The corresponding argument data from the reference function stub.
function ReferenceArgument(_fromproject, _fromstub) constructor {
    name = _fromproject.name;
    datatype = _fromproject.datatype;
    is_optional = _fromproject.is_optional;
    default_value = _fromproject.default_value;
    usage = undefined;
    description = _fromproject.description;
    
    if (is_undefined(_fromstub))
        return;
    
    usage = _fromstub.usage;
    description = _fromstub.description ?? description;
}
