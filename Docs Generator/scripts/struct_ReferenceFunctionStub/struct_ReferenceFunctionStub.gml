/// @func ReferenceFunctionStub(keyname,summary,arguments,returns,sections)
/// @desc A structure representing a function as described in the reference documentation.
/// @arg {String} keyname                                       The name identifying the function within the Community Toolbox project.
/// @arg {String} summary                                       The summary to use in the reference.
/// @arg {Array<Struct.ReferenceArgumentStub>} arguments        The arguments information to use in the reference.
/// @arg {String} returns                                       The return type to use in the reference.
/// @arg {Array<Struct.ReferenceSection>} sections              Sections containing additional details.
function ReferenceFunctionStub(_keyname, _summary, _arguments, _returns, _sections) : ReferenceItemStub("func", _keyname, _keyname, _summary, _sections) constructor {
    arguments = _arguments;
    return_type = _returns;
}
