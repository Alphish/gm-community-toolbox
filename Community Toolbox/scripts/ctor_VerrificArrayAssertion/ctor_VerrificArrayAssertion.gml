/// @func VerrificArrayAssertion(asserter,actual)
/// @desc A struct handling fluent assertions for the given array.
/// @arg {Struct.VerrificAsserter} asserter     The inner asserter.
/// @arg {Array} actual                         The array to assert.
function VerrificArrayAssertion(_asserter, _actual) constructor {
    asserter = _asserter;
    actual = _actual;
    can_assert = is_undefined(_actual) || asserter.assert_is_array(_actual);
    
    /// @func should_be(expected,[onfailure])
    /// @desc Asserts that the asserted array value is equal to the expected one.
    /// @arg {Array} expected           The expected array value.
    /// @arg {String} onfailure         A custom message to show in case of a failure.
    static should_be = function(_expected, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_equal(_expected, actual, _onfailure);
        
        return self;
    }
    
    /// @func should_be_empty([onfailure])
    /// @desc Asserts that the asserted array has no items.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static should_be_empty = function(_onfailure) {
        if (can_assert)
            asserter.assert_is_empty(actual, _onfailure);
        
        return self;
    }
    
    /// @func should_have_count(expected,[onfailure])
    /// @desc Asserts that the asserted array has the expected number of items.
    /// @arg {Real} expected            The expected number of items.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static should_have_count = function(_expected, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_count(_expected, actual, _onfailure);
        
        return self;
    }
    
    /// @func should_equal_array(expected)
    /// @desc Asserts that the asserted array has the expected items sequence.
    /// @arg {Array} expected       The expected items sequence.
    static should_equal_array = function(_expected) {
        if (can_assert)
            asserter.assert_array_equal(_expected, actual);
        
        return self;
    }
    
    /// @func should_equal_items(...items)
    /// @desc Asserts that the asserted array has the expected items sequence.
    /// @arg {Array} items          The expected items sequence.
    static should_equal_items = function() {
        if (!can_assert)
            return self;
        
        var _expected = array_create(argument_count);
        for (var i = 0; i < argument_count; i++) {
            _expected[i] = argument[i];
        }
        asserter.assert_array_equal(_expected, actual);
        return self;
    }
}
