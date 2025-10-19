/// @func VerrificStructAssertion(asserter,actual)
/// @desc A struct handling fluent assertions for the given struct.
/// @arg {Struct.VerrificAsserter} asserter     The inner asserter.
/// @arg {Struct} actual                        The struct to assert.
function VerrificStructAssertion(_asserter, _actual) constructor {
    asserter = _asserter;
    actual = _actual;
    can_assert = is_undefined(_actual) || asserter.assert_is_struct(_actual);
    
    /// @func should_be(expected,[onfailure])
    /// @desc Asserts that the asserted struct value is equal to the expected one.
    /// @arg {Struct} expected          The expected struct value.
    /// @arg {String} onfailure         A custom message to show in case of a failure.
    static should_be = function(_expected, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_equal(_expected, actual, _onfailure);
        
        return self;
    }
    
    /// @func should_be_empty([onfailure])
    /// @desc Asserts that the asserted struct has no items.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static should_be_empty = function(_onfailure) {
        if (can_assert)
            asserter.assert_is_empty(actual, _onfailure);
        
        return self;
    }
    
    /// @func should_have_count(expected,[onfailure])
    /// @desc Asserts that the asserted struct has the expected number of entries.
    /// @arg {Real} expected            The expected number of entries.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static should_have_count = function(_expected, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_count(_expected, actual, _onfailure);
        
        return self;
    }
    
    /// @func should_equal_struct(expected)
    /// @desc Asserts that the asserted struct has matching entries.
    /// @arg {Struct} expected      The expected struct.
    static should_equal_struct = function(_expected) {
        if (can_assert)
            asserter.assert_struct_equal(_expected, actual);
        
        return self;
    }
    
    /// @func should_have_entry(key,value,[onfailure])
    /// @desc Asserts that the asserted struct has a given entry.
    /// @arg {String} key               The key of the expected entry.
    /// @arg {Any} value                The value of the expected entry.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static should_have_entry = function(_key, _value, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_struct_has_entry(actual, _key, _value, _onfailure);
        
        return self;
    }
}
