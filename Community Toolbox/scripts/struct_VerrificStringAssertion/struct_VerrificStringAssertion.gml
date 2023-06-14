/// @func VerrificStringAssertion(asserter,actual)
/// @desc A struct handling fluent assertions for the given string.
/// @arg {Struct.VerrificAsserter} asserter     The inner asserter.
/// @arg {String} actual                        The string to assert.
function VerrificStringAssertion(_asserter, _actual) constructor {
    asserter = _asserter;
    actual = _actual;
    can_assert = is_undefined(_actual) || asserter.assert_is_string(_actual);
    
    /// @func should_be(expected,[onfailure])
    /// @desc Asserts that the given string is equal to the expected string.
    /// @arg {String} expected      The expected string value.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be = function(_expected, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_equal(_expected, actual, _onfailure);
        return self;
    }
    
    /// @func should_be_empty(expected,[onfailure])
    /// @desc Asserts that the given string is empty.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_empty = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_empty_string(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_undefined(expected,[onfailure])
    /// @desc Asserts that the given string is undefined.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_undefined = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_undefined(actual, _onfailure);
        return self;
    }
}
