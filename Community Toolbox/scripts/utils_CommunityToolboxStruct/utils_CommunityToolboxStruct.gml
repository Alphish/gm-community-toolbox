/// @func struct_assign(destination,[...sources])
/// @desc Assigns properties from one or more source structs to a destination struct, and returns the destination struct.
/// @arg {Struct} destination       The struct to assign properties to.
/// @arg {Struct} [...sources]      The source structs to get properties values from.
/// @returns {Struct}
function struct_assign(_destination) {
    static assign_function = function(_key, _value) {
        self[$ _key] = _value;
    };
    
    var _assign_method = method(_destination, assign_function);
    for (var i = 1; i < argument_count; i++) {
        struct_foreach(argument[i], _assign_method);
    }
    
    return _destination;
}
