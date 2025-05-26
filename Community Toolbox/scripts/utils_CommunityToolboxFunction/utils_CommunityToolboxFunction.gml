#region Constructors

/// @func is_constructor(function)
/// @desc Checks if the given function is marked as a constructor.
/// @arg {Function} function        The function to check.
/// @returns {Bool}
function is_constructor(_function) {
    if (is_method(_function))
        _function = method_get_index(_function);
    
    return asset_has_tags(_function, "@@constructor", asset_script);
}

/// @func constructor_get_parent(function)
/// @desc Gets the parent constructor of the given function, or undefined if no such parent was found.
/// @arg {Function} function        The function to get the parent constructor of.
/// @returns {Function,Undefined}
function constructor_get_parent(_function) {
    if (is_method(_function))
        _function = method_get_index(_function);
    
    if (!asset_has_tags(_function, "@@constructor", asset_script))
        return undefined;
    
    var _tags = asset_get_tags(_function, asset_script);
    var _tag_index = array_find_index(_tags, function(_tag) { return string_starts_with(_tag, "@@parent="); });
    if (_tag_index < 0)
        return undefined;
    
    var _parent_name = string_delete(_tags[_tag_index], 1, string_length("@@parent="));
    return asset_get_index(_parent_name);
}

/// @func constructor_get_children(function)
/// @desc Gets the children constructors of the given constructor, or an empty array 
/// @arg {Function} function        The function to get the children constructors of.
/// @returns {Array<Function>}
function constructor_get_children(_function) {
    if (is_method(_function))
        _function = method_get_index(_function);
    
    if (!asset_has_tags(_function, "@@constructor", asset_script))
        return undefined;
    
    return tag_get_asset_ids("@@parent=" + script_get_name(_function), asset_script);
}

/// @func constructor_call(constructor,[args],[offset],[length])
/// @desc Creates a new instance of the given constructor.
/// @arg {Function} constructor     The constructor to create the instance of.
/// @arg {Array} [args]             Arguments to pass into the constructor (empty by default).
/// @arg {Real} [offset]            The arguments array index to start taking arguments from (0 by default).
/// @arg {Real} [length]            The number of arguments to take from the array (all by default).
/// @returns {Struct}
function constructor_call(_constructor, _args = undefined, _offset = 0, _length = undefined) {
    if (is_undefined(_args) || array_length(_args) == 0)
        return new _constructor();
    
    _length ??= array_length(_args);
    
    // determining the surrounding context the constructor will be called from
    // it's to ensure "other" keyword refers the expected context in the constructor
    var _context = !is_method(_constructor) ? (self) : (method_get_self(_constructor) ?? self);
    
    with (_context) {
        var _result = {};
        with (_result) {
            script_execute_ext(_constructor, _args, _offset, _length);
            static_set(_result, static_get(_constructor));
            return _result;
        }
    }
}

#endregion

#region Static initialization

/// @func static_init(function)
/// @desc Runs a given function in order to initialize its static values, then returns that function's static struct.
/// @arg {Function} function    The function to initialize the static variables of.
/// @returns {Struct}
function static_init(_function) {
    static static_init_context = script_execute(function() {
        static_init_in_progress();
        return static_init_in_progress.static_init_context;
    });
    
    var _static_struct = static_get(_function);
    if (struct_names_count(_static_struct) > 0)
        return _static_struct;
    
    with (static_init_context) {
        script_execute(_function);
    }
    
    if (struct_names_count(static_init_context) > 0) {
        throw $"The context has been modified during static initialization of {script_get_name(_function)}. Prevent any assignments during static initialization with static_init_in_progress() check.";
    }
    
    return _static_struct;
}

/// @func static_init_in_progress()
/// @desc Checks whether the code runs from the static initialization context. Use it to exit early from the function's non-static code.
/// @returns {Bool}
function static_init_in_progress() {
    static static_init_context = {};
    return self == static_init_context;
}

#endregion
