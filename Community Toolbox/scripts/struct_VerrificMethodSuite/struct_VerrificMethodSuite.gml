/// @func VerrificMethodSuite(type,[description])
/// @desc A test suite gathering test methods of the given test type.
/// @arg {Function} type            The constructor of the test type.
/// @arg {String} description       The description of the test suite.
function VerrificMethodSuite(_type, _description = undefined) : VerrificSuite(_description) constructor {
    if (is_undefined(_type))
        return; // for static initialisation
    
    test_type = _type;
    var _dummy = new _type(/* run */ undefined, /* method */ undefined); // initializing the statics for the test type
    test_type_info = static_get(_type);
    
    /// @ignore
    static suite_explore = function() {
        suite_description = suite_description ?? test_type_info.test_suite_describe();
        var _methods = find_test_methods();
        array_foreach(_methods, self.add_method_item);
        suite_is_explored = true;
    }
    
    // --------
    // Creating
    // --------
    
    /// @func from(type,[description])
    /// @desc Creates a method-based test suite for the given test type.
    /// @arg {Function} type            The constructor of the test type.
    /// @arg {String} description       The description of the test suite.
    static from = function(_type, _description = undefined) {
        return new VerrificMethodSuite(_type, _description);
    }
    
    // ---------------
    // Methods finding
    // ---------------
    
    /// @ignore
    static find_test_methods = function() {
        var _methods = find_direct_test_methods() ?? find_filtered_test_methods();
        
        if (is_undefined(_methods) || array_length(_methods) == 0)
            throw $"Could not find test methods for {script_get_name(test_type)}";
        
        return _methods;
    }
    
    /// @ignore
    static find_direct_test_methods = function() {
        if (!is_array(test_type_info.test_suite_methods))
            return undefined;
        
        return test_type_info.test_suite_methods;
    }
    
    /// @ignore
    static find_filtered_test_methods = function() {
        if (!is_callable(test_type_info.test_suite_methods_filter))
            return undefined;
        
        // populate the method names from the filter
        var _result_struct = { result: [], test_type_info: test_type_info };
        var _fill_method = method(_result_struct, function(_key, _value) {
            if (self.test_type_info.test_suite_methods_filter(_key, _value))
                array_push(self.result, _key);
        });
        struct_foreach(test_type_info, _fill_method);
        
        // organise the result
        array_sort(_result_struct.result, true);
        return _result_struct.result;
    }
    
    // ------------
    // Tests adding
    // ------------
    
    /// @ignore
    static add_method_item = function(_method) {
        var _description = test_type_info.test_describe(_method);
        var _stub = new VerrificMethodTestStub(_description, test_type, _method);
        add_test(_stub);
    }
}

// initializing the statics

var _dummy = new VerrificMethodSuite(undefined);
