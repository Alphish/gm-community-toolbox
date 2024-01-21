/// @func ReferenceArgumentStub(keyname,usage,description)
/// @desc A structure representing an argument as described in the reference documentation.
/// @arg {String} keyname                   The name identifying the argument within its function.
/// @arg {String,Undefined} usage           The usage description of the argument (whether it's required or optional, its default value if any).
/// @arg {String,Undefined} description     The argument description to use in the reference.
function ReferenceArgumentStub(_keyname, _usage, _description) constructor {
    keyname = _keyname;
    usage = _usage;
    description = _description;
}
