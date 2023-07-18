/// @func VerrificAsserter(run)
/// @desc A struct for performing assertions for the given test run.
/// @arg {Struct.VerrificTestItem} run      The test run to perform assertions on.
function VerrificAsserter(_run) constructor {
    test_run = _run;
    
    // --------------
    // Core functions
    // --------------
    
    #region
    
    /// @func assert_pass()
    /// @desc Confirms the test is asserted in the absence of more specific assertions. Doesn't erase already recorded failures.
    static assert_pass = function() {
        test_run.record_assertion();
    }
    
    /// @func assert_fail(message)
    /// @desc Records an assertion failure with a given message.
    /// @arg {String} message       The failure message.
    static assert_fail = function(_message) {
        test_run.record_assertion();
        test_run.record_failure(_message);
    }
    
    /// @func assert_that(condition, onfailure)
    /// @desc Checks whether the given condition is met, and if not, records an associated failure.
    /// @arg {Bool} condition       The condition to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_that = function(_condition, _onfailure) {
        test_run.record_assertion();
        if (_condition)
            return true; // the assertion passed
        
        test_run.record_failure(_onfailure);
        return false;
    }
    
    #endregion
    
    // ------------
    // Value checks
    // ------------
    
    #region
    
    /// @ignore
    static make_value_assertion = function(_expected, _expected_name, _actual, _onfailure = undefined) {
        _onfailure ??= $"The value should be {_expected} but is '{_actual}' instead.";
        return assert_that(_actual == _expected, _onfailure);
    }
    
    /// @func assert_is_undefined(value,[onfailure])
    /// @desc Asserts that a given value is undefined.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_undefined = function(_value, _onfailure = undefined) {
        return make_value_assertion(undefined, "undefined", _value, _onfailure);
    }
    
    /// @func assert_is_null(value,[onfailure])
    /// @desc Asserts that a given value is a null pointer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_null = function(_value, _onfailure = undefined) {
        return make_value_assertion(pointer_null, "null pointer", _value, _onfailure);
    }
    
    /// @func assert_is_nullish(value,[onfailure])
    /// @desc Asserts that a given value is null or undefined.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_nullish = function(_value, _onfailure = undefined) {
        return make_value_assertion(undefined, "nullish", _value ?? undefined, _onfailure);
    }
    
    /// @func assert_is_noone(value,[onfailure])
    /// @desc Asserts that a given value is a noone.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_noone = function(_value, _onfailure = undefined) {
        return make_value_assertion(_value, noone, "noone", _onfailure);
    }
    
    /// @func assert_is_true(value,[onfailure])
    /// @desc Asserts that a given value is true.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_true = function(_value, _onfailure = undefined) {
        return make_value_assertion(true, "true", _value, _onfailure);
    }
    
    /// @func assert_is_false(value,[onfailure])
    /// @desc Asserts that a given value is false.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_false = function(_value, _onfailure = undefined) {
        return make_value_assertion(false, "false", _value, _onfailure);
    }
    
    /// @func assert_is_zero(value,[onfailure])
    /// @desc Asserts that a given value is 0.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_zero = function(_value, _onfailure = undefined) {
        return make_value_assertion(0, "0", _value, _onfailure);
    }
    
    /// @func assert_is_one(value,[onfailure])
    /// @desc Asserts that a given value is 1.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_one = function(_value, _onfailure = undefined) {
        return make_value_assertion(1, "1", _value, _onfailure);
    }
    
    /// @func assert_is_minus_one(value,[onfailure])
    /// @desc Asserts that a given value is -1.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_minus_one = function(_value, _onfailure = undefined) {
        return make_value_assertion(-1, "-1", _value, _onfailure);
    }
    
    /// @func assert_is_nan(value,[onfailure])
    /// @desc Asserts that a given value is a NaN.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_nan = function(_value, _onfailure = undefined) {
        // making a separate logic here, because NaN != NaN
        _onfailure ??= $"The value should be NaN but is '{_value}' instead.";
        return assert_that(is_nan(_value), _onfailure);
    }
    
    /// @func assert_is_plus_infinity(value,[onfailure])
    /// @desc Asserts that a given value is +infinity.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_plus_infinity = function(_value, _onfailure = undefined) {
        return make_value_assertion(+infinity, "+infinity", _value, _onfailure);
    }
    
    /// @func assert_is_minus_infinity(value,[onfailure])
    /// @desc Asserts that a given value is -infinity.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_minus_infinity = function(_value, _onfailure = undefined) {
        return make_value_assertion(-infinity, "-infinity", _value, _onfailure);
    }
    
    /// @func assert_is_empty_string(value,[onfailure])
    /// @desc Asserts that a given value is an empty string.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_empty_string = function(_value, _onfailure = undefined) {
        return make_value_assertion("", "an empty string", _value, _onfailure);
    }
    
    #endregion
    
    // -----------
    // Type checks
    // -----------
    
    #region
    
    /// @ignore
    static make_type_assertion = function(_expected_type, _condition, _value, _onfailure = undefined) {
        if (is_undefined(_onfailure)) {
            var _actual_type = get_actual_type(_value);
            _onfailure = $"The value should be of {_expected_type} type but is of {_actual_type} type instead.";
        }
        return assert_that(_condition, _onfailure);
    }
    
    /// @ignore
    static get_actual_type = function(_value) {
        var _typeof = typeof(_value);
        if (_typeof == "struct") {
            var _instanceof = instanceof(_value);
            return _instanceof == "struct" ? "struct literal" : _instanceof + " struct";
        } else if (_typeof == "ref") {
            return instance_exists(_value) ? object_get_name(_value) + " id" : "unknown instance id";
        } else {
            return _typeof;
        }
    }
    
    /// @func assert_is_bool(value,[onfailure])
    /// @desc Asserts that a given value is a bool.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_bool = function(_value, _onfailure = undefined) {
        return make_type_assertion("bool", is_bool(_value), _value, _onfailure);
    }
    
    /// @func assert_is_int32(value,[onfailure])
    /// @desc Asserts that a given value is a 32-bit integer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_int32 = function(_value, _onfailure = undefined) {
        return make_type_assertion("32-bit integer", is_int32(_value), _value, _onfailure);
    }

    /// @func assert_is_int64(value,[onfailure])
    /// @desc Asserts that a given value is a 64-bit integer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_int64 = function(_value, _onfailure = undefined) {
        return make_type_assertion("64-bit integer", is_int64(_value), _value, _onfailure);
    }

    /// @func assert_is_real(value,[onfailure])
    /// @desc Asserts that a given value is a real value, other than a 64-bit integer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_real = function(_value, _onfailure = undefined) {
        return make_type_assertion("real", is_real(_value), _value, _onfailure);
    }
    
    /// @func assert_is_a_number(value,[onfailure])
    /// @desc Asserts that a given value is a finite number. For the purposes of assertion, bools don't count as numerics!
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_a_number = function(_value, _onfailure = undefined) {
        var _condition = is_numeric(_value) && !is_bool(_value) && !is_nan(_value) && !is_infinity(_value);
        return make_type_assertion("a number", _condition, _value, _onfailure);
    }

    /// @func assert_is_numeric(value,[onfailure])
    /// @desc Asserts that a given value is numeric. For the purposes of assertion, bools don't count as numerics!
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_numeric = function(_value, _onfailure = undefined) {
        return make_type_assertion("a number", is_numeric(_value) && !is_bool(_value), _value, _onfailure);
    }

    /// @func assert_is_ptr(value,[onfailure])
    /// @desc Asserts that a given value is a pointer.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_ptr = function(_value, _onfailure = undefined) {
        return make_type_assertion("ptr", is_ptr(_value), _value, _onfailure);
    }
    
    /// @func assert_is_string(value,[onfailure])
    /// @desc Asserts that a given value is a string.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_string = function(_value, _onfailure = undefined) {
        return make_type_assertion("string", is_string(_value), _value, _onfailure);
    }
    
    /// @func assert_is_array(value,[onfailure])
    /// @desc Asserts that a given value is an array.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_array = function(_value, _onfailure = undefined) {
        return make_type_assertion("array", is_array(_value), _value, _onfailure);
    }

    /// @func assert_is_struct(value,[onfailure])
    /// @desc Asserts that a given value is a struct. For the purposes of assertion, methods don't count as structs!
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_struct = function(_value, _onfailure = undefined) {
        return make_type_assertion("struct", is_struct(_value) && !is_method(_value), _value, _onfailure);
    }
    
    /// @func assert_is_struct_literal(value,[onfailure])
    /// @desc Asserts that a given value is a struct not created with a constructor.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_struct_literal = function(_value, _onfailure = undefined) {
        return make_type_assertion("struct literal", instanceof(_value) == "struct" && !is_method(_value), _value, _onfailure);
    }
    
    /// @func assert_is_instanceof_struct(value,[onfailure])
    /// @desc Asserts that a given value is a struct created from the given constructor.
    /// @arg {Function} constructor     The constructor the value should be created from.
    /// @arg {Any} value                The value to assert.
    /// @arg {String} onfailure         A custom message to show in case of a failure.
    static assert_is_instanceof_struct = function(_constructor, _value, _onfailure = undefined) {
        return make_type_assertion(script_get_name(_constructor) + " struct", is_instanceof(_value, _constructor), _value, _onfailure);
    }
    
    /// @func assert_is_method(value,[onfailure])
    /// @desc Asserts that a given value is a method.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_method = function(_value, _onfailure = undefined) {
        return make_type_assertion("method", is_method(_value), _value, _onfailure);
    }
    
    /// @func assert_is_callable(value,[onfailure])
    /// @desc Asserts that a given value is callable.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_callable = function(_value, _onfailure = undefined) {
        return make_type_assertion("callable", is_callable(_value), _value, _onfailure);
    }
    
    /// @func assert_is_instance_id(value,[onfailure])
    /// @desc Asserts that a given value is an instance id.
    /// @arg {Any} value            The value to assert.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_is_instance_id = function(_value, _onfailure = undefined) {
        return make_type_assertion("instance id", typeof(_value) == "ref", _value, _onfailure);
    }
    
    /// @func assert_is_instanceof_object(value,[onfailure])
    /// @desc Asserts that a given value is an instance of the given object type.
    /// @arg {Asset.GMObject} object        The object type the value should be instance of.
    /// @arg {Any} value                    The value to assert.
    /// @arg {String} onfailure             A custom message to show in case of a failure.
    static assert_is_instanceof_object = function(_object, _value, _onfailure = undefined) {
        return make_type_assertion(object_get_name(_object) + " id", instance_exists(_value) && (_value.object_index == _object || object_is_ancestor(_value.object_index, _object)), _value, _onfailure);
    }
    
    #endregion
    
    // ---------------
    // Equality checks
    // ---------------
    
    #region
    
    /// @func assert_equal(expected,actual,[onfailure])
    /// @desc Asserts that a given value is equal to another.
    /// @arg {Any} expected         The expected value.
    /// @arg {Any} actual           The actual value.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_equal = function(_expected, _actual, _onfailure = undefined) {
        _onfailure ??= $"The value should be '{_expected}' but is '{_actual}' instead.";
        return assert_that(_expected == _actual, _onfailure);
    }
	
	/// @func assert_in_array(expected_array,actual,[onfailure])
    /// @desc Asserts that a given value is a member of an expected array.
    /// @arg {Any} expected_array   The expected array with values.
    /// @arg {Any} actual           The actual value.
    /// @arg {String} onfailure     A custom message to show in case of a failure.
    static assert_in_array = function(_expected_array, _actual, _onfailure = undefined) {
		_onfailure ??= $"The value should be in '{_expected_array}' but is '{_actual}' instead.";
		
		var _condition = false;
		
		for (var _i=0, _n=array_length(_expected_array); _i<_n; _i++) {
			_condition |= (_actual == _expected_array[_i]);
		}
		
        return assert_that(_condition, _onfailure);
    }
        
    #endregion
}