/// @func VerrificSuite([description])
/// @desc A parent struct for Verrific test suites.
/// @arg {String} description       The description of the test suite.
function VerrificSuite(_description = undefined) constructor {
    suite_description = _description;
    suite_items = [];
    suite_is_explored = false;
    
    /// @func suite_explore()
    /// @desc Searches for inner suites and tests. Must be implemented in any VerrificSuite child struct.
    static suite_explore = function() {
        throw $"{instanceof(self)}.suite_explore() was not implemented.";
    }
    
    /// @func add_suite()
    /// @desc Adds a child suite to the suite.
    static add_suite = function(_suite) {
        array_push(suite_items, _suite);
    }
    
    /// @func add_test()
    /// @desc Adds a test to the suite.
    static add_test = function(_stub) {
        array_push(suite_items, _stub);
    }
}
