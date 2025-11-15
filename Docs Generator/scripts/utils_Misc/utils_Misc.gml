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
