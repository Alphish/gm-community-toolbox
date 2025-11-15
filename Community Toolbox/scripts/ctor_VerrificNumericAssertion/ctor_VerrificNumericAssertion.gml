/// @func VerrificNumericAssertion(asserter,actual)
/// @desc A struct handling fluent assertions for the given numeric value.
/// @arg {Struct.VerrificAsserter} asserter     The inner asserter.
/// @arg {Real} actual                          The numeric value to assert.
function VerrificNumericAssertion(_asserter, _actual) constructor {
    asserter = _asserter;
    actual = _actual;
    can_assert = is_undefined(_actual) || asserter.assert_is_numeric(_actual);
    
    /// @func should_be(expected,[onfailure])
    /// @desc Asserts that the given numeric value is equal to the expected one.
    /// @arg {Real} expected        The expected numeric value.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be = function(_expected, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_equal(_expected, actual, _onfailure);
        return self;
    }
    
    /// @func should_be_one_of(items,[onfailure])
    /// @desc Asserts that the given numeric value is equal to one of expected values.
    /// @arg {Array} items          The possible expected values.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_one_of = function(_items, _onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_one_of(_items, actual, _onfailure);
        return self;
    }
    
    // ------------
    // Value checks
    // ------------
    
    #region
    
    /// @func should_be_zero([onfailure])
    /// @desc Asserts that the given value is 0.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_zero = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_zero(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_one([onfailure])
    /// @desc Asserts that the given value is 1.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_one = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_one(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_nan([onfailure])
    /// @desc Asserts that the given value is a NaN.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_nan = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_nan(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_minus_one([onfailure])
    /// @desc Asserts that the given value is -1.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_minus_one = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_minus_one(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_plus_infinity([onfailure])
    /// @desc Asserts that the given value is +infinity.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_plus_infinity = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_plus_infinity(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_minus_infinity([onfailure])
    /// @desc Asserts that the given value is -infinity.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_minus_infinity = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_minus_infinity(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_undefined([onfailure])
    /// @desc Asserts that the given value is undefined.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_undefined = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_undefined(actual, _onfailure);
        return self;
    }
    
    #endregion
    
    // -----------
    // Type checks
    // -----------
    
    #region
    
    /// @func should_be_int32([onfailure])
    /// @desc Asserts that the given value is a 32-bit integer.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_int32 = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_int32(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_int64([onfailure])
    /// @desc Asserts that the given value is a 64-bit integer.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_int64 = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_int64(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_real([onfailure])
    /// @desc Asserts that the given value is a real value, other than a 64-bit integer.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_real = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_real(actual, _onfailure);
        return self;
    }
    
    /// @func should_be_a_number([onfailure])
    /// @desc Asserts that the given value is a finite number.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static should_be_a_number = function(_onfailure = undefined) {
        if (can_assert)
            asserter.assert_is_a_number(actual, _onfailure);
        return self;
    }
    
    #endregion
}
