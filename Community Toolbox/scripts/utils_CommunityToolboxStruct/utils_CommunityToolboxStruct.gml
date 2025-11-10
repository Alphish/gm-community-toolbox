/// @func is_nonempty_struct(value)
/// @desc Checks if a given value is a struct that's not empty.
/// @arg {Any} value            The value to check.
/// @returns {Bool}
function is_nonempty_struct(_value) {
    gml_pragma("forceinline");
    return is_struct(_value) && struct_names_count(_value) > 0;
}

/// @func struct_clone(struct,[deep])
/// @desc Creates a clone of the given struct. The clone may be shallow (values are same between structs) or deep (nested values are cloned, too).
/// @arg {Struct} struct        The struct to clone.
/// @arg {Bool} [deep]          Whether to make a deep or shallow clone (shallow by default).
/// @returns {Struct}
function struct_clone(_struct, _deep = false) {
    if (!is_struct(_struct)) {
        throw $"Trying to clone a struct, but the given value is {typeof(_struct)} instead.";
    }
    
    if (_deep)
        return variable_clone(_struct, 128); // note: 128 is the highest possible variable_clone depth
    else
        return struct_assign({}, _struct); // it should be doable with variable_clone, but it seems shallow copy is bugged on 2024.11
}

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

/// @func struct_filter(struct,predicate)
/// @desc Creates a new filtered struct from existing one, with entries meeting the given predicate condition.
/// @arg {Struct} struct            The struct to filter entries from.
/// @arg {Function} predicate       The predicate to check struct entries (key-value pairs).
/// @returns {Struct}
function struct_filter(_struct, _predicate) {
    var _result = {};
    var _keys = struct_get_names(_struct);
    
    for (var i = 0, _count = array_length(_keys); i < _count; i++) {
        var _key = _keys[i];
        var _value = _struct[$ _key];
        
        if (_predicate(_key, _value))
            _result[$ _key] = _value;
    }
    return _result;
}
