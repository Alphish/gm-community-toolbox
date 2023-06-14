/// @func VerrificSuiteGroup(description)
/// @desc A Verrific suite that groups other suites together.
/// @arg {String} description           The description of the suite group.
function VerrificSuiteGroup(_description) : VerrificSuite(_description) constructor {
    
    /// @func create(description)
    /// @desc Creates a Verrific suite group with a given description.
    /// @arg {String} description       The description of the suite group.
    static create = function(_description) {
        return new VerrificSuiteGroup(_description);
    }
    
    /// @ignore
    static suite_explore = function() {
        // the suite group items were already added ahead of time
        // so you only need to mark it as explored
        suite_is_explored = true;
    }
    
    /// @func add_methods_from(type,[description])
    /// @desc Adds a method-based suite from the given test type.
    /// @arg {Function} type            The constructor of the test type.
    /// @arg {String} description       The description of the suite.
    static add_methods_from = function(_type, _description = undefined) {
        var _suite = new VerrificMethodSuite(_type, _description);
        add_suite(_suite);
    }
    
    /// @func add_group(description)
    /// @desc Adds a Verrific suite subgroup with a given description.
    /// @arg {String} description       The description of the suite group.
    /// @returns {Struct.VerrificSuiteGroup}
    static add_group = function(_description) {
        var _suite = new VerrificSuiteGroup(_description);
        add_suite(_suite);
        return _suite;
    }
}

// initializing the statics
var _parent_dummy = new VerrificSuite(undefined);
var _dummy = new VerrificSuiteGroup("");
