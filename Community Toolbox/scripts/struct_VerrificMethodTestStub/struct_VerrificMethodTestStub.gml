/// @func VerrificTestStub(description)
/// @desc A Verrific test stub creating a method-based test.
/// @arg {String} description       The test description.
/// @arg {Function} type            The constructor of the test type.
/// @arg {String} method            The name of the test method to run.
function VerrificMethodTestStub(_description, _type, _method) : VerrificTestStub(_description) constructor {
    test_type = _type;
    test_method = _method;
    
    /// @ignore
    static create_test = function(_run) {
        return new test_type(_run, test_method);
    }
}
