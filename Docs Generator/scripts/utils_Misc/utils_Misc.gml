/// @func static_init(func)
/// @desc Runs a given function from the static init context, so that core function logic won't be executed when setting static function variables.
/// @arg {Function} func        The function to initialise the static variables of.
function static_init(_func) {
    static context = { };
    
    with (context) {
        _func();
        
        if (struct_names_count(self) > 0) {
            throw $"The static init context was changed when initialising statics of {script_get_name(_func)}.\n" +
                  $"Use static_init_in_progress() to exit early from the function.";
        }
    }
}

/// @func static_init_in_progress()
/// @desc Checks whether the current logic is processed from the static init context or not. Use it to exit early when initialising static variables.
function static_init_in_progress() {
    return self == static_init.context;
}
