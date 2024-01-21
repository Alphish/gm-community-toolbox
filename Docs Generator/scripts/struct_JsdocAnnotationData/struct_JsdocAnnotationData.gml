/// @func JsdocAnnotationData(signature,description,arguments,returns)
/// @desc A structure storing JSDoc annotation data for the given Toolbox function.
/// @arg {Struct.JsdocFunctionSignature} signature      The function signature as defined in the @func tag.
/// @arg {String} description                           The function description as given in the @desc tag.
/// @arg {Array<Struct.JsdocArgument>} arguments        The function arguments as defined in the @arg tags.
/// @arg {String} returns                               The return type as given in the @returns tag.
function JsdocAnnotationData(_signature, _description, _arguments, _returns) constructor {
    function_signature = _signature;
    description = _description;
    arguments_details = _arguments;
    return_type = _returns;
    
    is_valid = is_struct(function_signature) && function_signature.is_valid && !is_undefined(description);
}
