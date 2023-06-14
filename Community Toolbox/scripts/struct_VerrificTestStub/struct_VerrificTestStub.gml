/// @func VerrificTestStub(description)
/// @desc A parent struct for Verrific test stubs, responsible for creating test instances when needed.
/// @arg {String} description       The test description.
function VerrificTestStub(_description) constructor {
    description = _description;
    
    /// @func create_test(run)
    /// @desc Creates a test instance for a given test run. Must be implemented in any VerrificTestStub child struct.
    /// @arg {Struct.VerrificTestRun} run       The test run the test instance is created for.
    static create_test = function(_run) {
        throw $"{instanceof(self)}.create_test() was not implemented.";
    }
}
