/// @func VerrificTest(run)
/// @desc A parent struct for Verrific test instances.
/// @arg {Struct.VerrificTestRun} run         The test run responsible for the test.
function VerrificTest(_run) constructor {
    test_run = _run;
    test_asserter = new VerrificAsserter(_run); 
    
    // --------------
    // Tests handling
    // --------------
    
    /// @func test_execute()
    /// @desc Executes the test logic. Must be implemented in any VerrificTest child struct.
    static test_execute = function() {
        throw $"{instanceof(self)}.test_execute() was not implemented.";
    }
    
    /// @func test_cleanup()
    /// @desc Performs the cleanup after finishing the test. Doesn't perform any cleanup tasks by default.
    static test_cleanup = function() {
        // by default, there's no special cleanup logic
    }
    
    // --------------
    // Run operations
    // --------------
    
    /// @func record_message(message)
    /// @desc Records a message from the test progress.
    /// @arg {Struct.VerrificMessage,String} message        The message to record.
    static record_message = function(_message) {
        return test_run.record_message(_message);
    }
    
    /// @func ensure_no_failure([message])
    /// @desc Makes sure no failures were encountered so far, interrupts the test otherwise.
    /// @arg {String} message           A message to show if the interruption happened.
    static ensure_no_failure = function(_message = undefined) {
        return test_run.ensure_no_failure(_message);
    }
    
    /// @func finish_unsure([message])
    /// @desc Interrupts the test with the unsure result (neither passing nor failure).
    /// @arg {String} message           A message to explain why the test is not conclusive.
    static finish_unsure = function(_message = undefined) {
        return test_run.finish_unsure(_message);
    }
    
    // ---------------
    // Core assertions
    // ---------------
    
    #region
    
    /// @func assert_pass()
    /// @desc Confirms the test is asserted in the absence of more specific assertions. Doesn't erase already recorded failures.
    static assert_pass = function() {
        test_asserter.assert_pass();
    }
    
    /// @func assert_fail(message)
    /// @desc Records an assertion failure with a given message.
    /// @arg {String} message       The failure message.
    static assert_fail = function(_message) {
        test_asserter.assert_fail(_message);
    }
    
    /// @func assert_that(condition, onfailure)
    /// @desc Checks whether the given condition is met, and if not, records an associated failure.
    /// @arg {Bool} condition       The condition to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_that = function(_condition, _onfailure) {
        test_asserter.assert_that(_condition, _onfailure);
    }
    
    #endregion
    
    // ------------
    // Value checks
    // ------------
    
    #region
    
    /// @func assert_is_undefined(value,[onfailure])
    /// @desc Asserts that a given value is undefined.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_undefined = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_undefined(_value, _onfailure)
    }
    
    /// @func assert_is_null(value,[onfailure])
    /// @desc Asserts that a given value is a null pointer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_null = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_null(_value, _onfailure)
    }
    
    /// @func assert_is_nullish(value,[onfailure])
    /// @desc Asserts that a given value is null or undefined.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_nullish = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_nullish(_value, _onfailure)
    }
    
    /// @func assert_is_noone(value,[onfailure])
    /// @desc Asserts that a given value is a noone.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_noone = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_noone(_value, _onfailure)
    }
    
    /// @func assert_is_true(value,[onfailure])
    /// @desc Asserts that a given value is true.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_true = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_true(_value, _onfailure)
    }
    
    /// @func assert_is_false(value,[onfailure])
    /// @desc Asserts that a given value is false.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_false = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_false(_value, _onfailure)
    }
    
    /// @func assert_is_zero(value,[onfailure])
    /// @desc Asserts that a given value is 0.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_zero = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_zero(_value, _onfailure)
    }
    
    /// @func assert_is_one(value,[onfailure])
    /// @desc Asserts that a given value is 1.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_one = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_one(_value, _onfailure)
    }
    
    /// @func assert_is_minus_one(value,[onfailure])
    /// @desc Asserts that a given value is -1.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_minus_one = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_minus_one(_value, _onfailure)
    }
    
    /// @func assert_is_nan(value,[onfailure])
    /// @desc Asserts that a given value is a NaN.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_nan = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_nan(_value, _onfailure)
    }
    
    /// @func assert_is_plus_infinity(value,[onfailure])
    /// @desc Asserts that a given value is plus infinity.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_plus_infinity = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_plus_infinity(_value, _onfailure)
    }
    
    /// @func assert_is_minus_infinity(value,[onfailure])
    /// @desc Asserts that a given value is minus infinity.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_minus_infinity = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_minus_infinity(_value, _onfailure)
    }
    
    /// @func assert_is_empty_string(value,[onfailure])
    /// @desc Asserts that a given value is an empty string.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_empty_string = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_empty_string(_value, _onfailure)
    }
    
    #endregion
    
    // -----------
    // Type checks
    // -----------
    
    #region
    
    /// @func assert_is_bool(value,[onfailure])
    /// @desc Asserts that a given value is a bool.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_bool = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_bool(_value, _onfailure)
    }
    
    /// @func assert_is_int32(value,[onfailure])
    /// @desc Asserts that a given value is a 32-bit integer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_int32 = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_int32(_value, _onfailure)
    }

    /// @func assert_is_int64(value,[onfailure])
    /// @desc Asserts that a given value is a 64-bit integer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_int64 = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_int64(_value, _onfailure)
    }

    /// @func assert_is_real(value,[onfailure])
    /// @desc Asserts that a given value is a real value, other than a 64-bit integer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_real = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_real(_value, _onfailure)
    }
    
    /// @func assert_is_a_number(value,[onfailure])
    /// @desc Asserts that a given value is a finite number. For the purposes of assertion, bools don't count as numerics!
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_a_number = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_a_number(_value, _onfailure)
    }

    /// @func assert_is_numeric(value,[onfailure])
    /// @desc Asserts that a given value is numeric. For the purposes of assertion, bools don't count as numerics!
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_numeric = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_numeric(_value, _onfailure)
    }

    /// @func assert_is_ptr(value,[onfailure])
    /// @desc Asserts that a given value is a pointer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_ptr = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_ptr(_value, _onfailure)
    }
    
    /// @func assert_is_string(value,[onfailure])
    /// @desc Asserts that a given value is a string.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_string = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_string(_value, _onfailure)
    }
    
    /// @func assert_is_array(value,[onfailure])
    /// @desc Asserts that a given value is an array.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_array = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_array(_value, _onfailure)
    }

    /// @func assert_is_struct(value,[onfailure])
    /// @desc Asserts that a given value is a struct. For the purposes of assertion, methods don't count as structs!
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_struct = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_struct(_value, _onfailure)
    }
    
    /// @func assert_is_struct_literal(value,[onfailure])
    /// @desc Asserts that a given value is a struct not created with a constructor.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_struct_literal = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_struct_literal(_value, _onfailure)
    }
    
    /// @func assert_is_instanceof_struct(value,[onfailure])
    /// @desc Asserts that a given value is a struct created from the given constructor.
    /// @arg {Function} constructor     The constructor the value should be created from.
    /// @arg {Any} value                The value to assert.
    /// @arg {String} onfailure         A custom message to show in case of a failure.
    static assert_is_instanceof_struct = function(_constructor, _value, _onfailure = undefined) {
        return test_asserter.assert_is_instanceof_struct(_constructor, _value, _onfailure)
    }
    
    /// @func assert_is_method(value,[onfailure])
    /// @desc Asserts that a given value is a method.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_method = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_method(_value, _onfailure)
    }
    
    /// @func assert_is_callable(value,[onfailure])
    /// @desc Asserts that a given value is callable.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_callable = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_callable(_value, _onfailure)
    }
    
    /// @func assert_is_instance_id(value,[onfailure])
    /// @desc Asserts that a given value is an instance id.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_instance_id = function(_value, _onfailure = undefined) {
        return test_asserter.assert_is_instance_id(_value, _onfailure)
    }
    
    /// @func assert_is_instanceof_object(value,[onfailure])
    /// @desc Asserts that a given value is an instance of the given object type.
    /// @arg {Asset.GMObject} object        The object type the value should be instance of.
    /// @arg {Any} value                    The value to assert.
    /// @arg {String} onfailure             A custom message to show in case of a failure.
    static assert_is_instanceof_object = function(_object, _value, _onfailure = undefined) {
        return test_asserter.assert_is_instanceof_object(_object, _value, _onfailure)
    }
    
    #endregion
    
    // ---------------
    // Equality checks
    // ---------------
    
    #region
    
    /// @func assert_equal(expected,actual,[onfailure])
    /// @desc Asserts that a given value is equal to the expected value.
    /// @arg {Any} expected         The expected value.
    /// @arg {Any} actual           The actual value.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_equal = function(_expected, _actual, _onfailure = undefined) {
        return test_asserter.assert_equal(_expected, _actual, _onfailure)
    }
    
    /// @func assert_array_equal(expected,actual)
    /// @desc Asserts that given arrays have the same items sequence.
    /// @arg {Array} expected           The expected item sequence.
    /// @arg {Array} actual             The actual array.
    static assert_array_equal = function(_expected, _actual) {
        return test_asserter.assert_array_equal(_expected, _actual);
    }
    
    /// @func assert_struct_equal(expected,actual)
    /// @desc Asserts that given structs have the same entries.
    /// @arg {Struct} expected          The expected struct entries.
    /// @arg {Struct} actual            The actual struct entries.
    static assert_struct_equal = function(_expected, _actual) {
        return test_asserter.assert_struct_equal(_expected, _actual);
    }
    
    #endregion
    
    // --------------------
    // Miscellaneous checks
    // --------------------
    
    #region
    
    /// @func assert_is_empty(value,[onfailure])
    /// @desc Asserts that a given value is empty. Applicable to strings, arrays and structs only.
    /// @arg {Any} value            The value to check.
    /// @arg {String} [onfailure]   A custom message to show in case of a failure.
    static assert_is_empty = function(_value, _onfailure) {
        return test_asserter.assert_is_empty(_value, _onfailure);
    }
    
    /// @func assert_count(expected,collection,[onfailure])
    /// @desc Asserts that a given collection has a given elements count. Applicable to arrays and structs only.
    /// @arg {Real} expected            The expected number of elements.
    /// @arg {Any} collection           The collection to check.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static assert_count = function(_expected, _collection, _onfailure) {
        return test_asserter.assert_count(_expected, _collection, _onfailure);
    }
    
    /// @func assert_is_one_of(items,actual,[onfailure])
    /// @desc Asserts that a given value is equal to one of expected values.
    /// @arg {Array} items          The possible expected values.
    /// @arg {Any} actual           The actual value.
    /// @arg {String} [onfailure]   A custom message to show in case of a failure.
    static assert_is_one_of = function(_items, _actual, _onfailure = undefined) {
        return test_asserter.assert_is_one_of(_items, _actual, _onfailure);
    }
    
    /// @func assert_struct_has_entry(struct,key,value,[onfailure])
    /// @desc Asserts that a given struct has the expected entry.
    /// @arg {Struct} struct            The struct to find the entry in.
    /// @arg {String} key               The key of the expected entry.
    /// @arg {Any} value                The value of the expected entry.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static assert_struct_has_entry = function(_struct, _key, _value, _onfailure = undefined) {
        return test_asserter.assert_struct_has_entry(_struct, _key, _value, _onfailure);
    }
    
    #endregion
}
