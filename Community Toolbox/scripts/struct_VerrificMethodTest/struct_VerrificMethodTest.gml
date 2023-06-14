/// @func VerrificMethodTest(run,method)
/// @desc The parent constructor for Verrific method-driven tests.
/// @arg {Struct.VerrificTestRun} run         The test run responsible for the test.
/// @arg {String} method                      The name of the test method.
function VerrificMethodTest(_run, _method) : VerrificTest(_run) constructor {
    test_type = static_get(self);
    test_method = _method;
    
    // ------------
    // Suite config
    // ------------
    
    // the name of the test subject, used in descriptions
    static test_subject = "Test subject";
    
    /// @func test_suite_describe()
    /// @desc Resolves the description for the associated test suite.
    /// @returns {String}
    static test_suite_describe = function() {
        return test_subject + " tests";
    }
    
    // the list of the test method names
    // if not given, a filter will be used instead
    static test_suite_methods = undefined;
    
    // the filter for finding valid test method names
    static test_suite_methods_filter = function(_key, _value) {
        if (!is_callable(_value))
            return false;
        
        if (!string_starts_with(_key, "should_"))
            return false;
        
        if (string_ends_with(_key, "__describe")) {
            return false;
        }
        
        return true;
    }
    
    /// @func test_describe()
    /// @desc Resolves the description for the given test method.
    /// @arg {String} method        The test method to get the description of.
    /// @returns {String}
    static test_describe = function(_method) {
        var _desc_variable = _method + "__describe";
        var _explicit_description = self[$ _desc_variable];
        if (is_string(_explicit_description))
            return _explicit_description;
        else if (is_callable(_explicit_description))
            return method(self, _explicit_description)(_method);
        
        var _method_phrase = string_replace_all(_method, "_", " ");
        return test_subject + " " + _method_phrase;
    }
    
    // -------------
    // Test handling
    // -------------
    
    /// @func test_execute()
    /// @desc Executes the test logic.
    static test_execute = function() {
        var _method_name = test_method;
        var _method_callable = self[$ _method_name] ?? test_type[$ _method_name];
        if (is_undefined(_method_callable))
            throw $"Test method {instanceof(self)}.{_method_name} doesn't exist.";
        if (!is_callable(_method_callable))
            throw $"{instanceof(self)}.{_method_name} is not a test method.";
        
        var _method = method(self, _method_callable);
        return _method();
    }
}
