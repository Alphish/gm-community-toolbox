/// @func VerrificAsserter(run)
/// @desc A struct for performing assertions for the given test run.
/// @arg {Struct.VerrificTestRun} run       The test run to perform assertions on.
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
        return true;
    }
    
    /// @func assert_fail(message)
    /// @desc Records an assertion failure with a given message.
    /// @arg {String} message       The failure message.
    static assert_fail = function(_message) {
        test_run.record_assertion();
        test_run.record_failure(_message);
        return false;
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
    /// @arg {Any} expected             The expected value.
    /// @arg {Any} actual               The actual value.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static assert_equal = function(_expected, _actual, _onfailure = undefined) {
        _onfailure ??= $"The value should be '{_expected}' but is '{_actual}' instead.";
        return assert_that(_expected == _actual, _onfailure);
    }
    
    /// @func assert_array_equal(expected,actual)
    /// @desc Asserts that given arrays have the same items sequence.
    /// @arg {Array} expected           The expected item sequence.
    /// @arg {Array} actual             The actual array.
    static assert_array_equal = function(_expected, _actual) {
        var _expected_length = array_length(_expected);
        var _actual_length = array_length(_actual);
        var _length = min(_expected_length, _actual_length);
        var _passed = true;
        for (var i = 0; i < _length; i++) {
            var _onfailure = $"The item #{i} should be '{_expected[i]}' but is '{_actual[i]}' instead.";
            _passed = assert_that(_expected[i] == _actual[i], _onfailure) && _passed;
        }
        if (_expected_length < _actual_length) {
            assert_fail($"Expected {_expected_length} items, but got {_actual_length} items instead. The first excess item: '{_actual[_expected_length]}'.");
            _passed = false;
        }
        else if (_expected_length > _actual_length) {
            assert_fail($"Expected {_expected_length} items, but got {_actual_length} items instead. The first missing item: '{_expected[_actual_length]}'.");
            _passed = false;
        }
        
        return _passed;
    }
    
    /// @func assert_struct_equal(expected,actual)
    /// @desc Asserts that given structs have the same entries.
    /// @arg {Struct} expected          The expected struct entries.
    /// @arg {Struct} actual            The actual struct entries.
    static assert_struct_equal = function(_expected, _actual) {
        var _expected_keys = struct_get_names(_expected);
        var _actual_keys = struct_get_names(_actual);
        var _common_keys = array_intersection(_expected_keys, _actual_keys);
        
        var _expected_count = array_length(_expected_keys);
        var _actual_count = array_length(_actual_keys);
        var _common_count = array_length(_common_keys);
        
        var _passed = true;
        
        if (_expected_count > _common_count) {
            for (var i = 0; i < _expected_count; i++) {
                if (struct_exists(_actual, _expected_keys[i]))
                    continue;
                
                assert_fail($"Expected an entry with key '{_expected_keys[i]}', but none was found.");
            }
            _passed = false;
        }
        
        if (_actual_count > _common_count) {
            for (var i = 0; i < _actual_count; i++) {
                if (struct_exists(_expected, _actual_keys[i]))
                    continue;
                
                assert_fail($"Unexpected entry with key '{_actual_keys[i]}'.");
            }
            _passed = false;
        }
        
        for (var i = 0; i < _common_count; i++) {
            var _key = _common_keys[i];
            var _expected_value = _expected[$ _key];
            var _actual_value = _actual[$ _key];
            var _onfailure = $"The entry '{_key}' should be '{_expected_value}' but is '{_actual_value}' instead.";
            _passed = assert_that(_expected_value == _actual_value, _onfailure) && _passed;
        }
        
        return _passed;
    }
    
    #endregion
    
    // --------------------
    // Miscellaneous checks
    // --------------------
    
    #region
    
    /// @func assert_is_empty(value,[onfailure])
    /// @desc Asserts that a given value is empty. Applicable to strings, arrays and structs only.
    /// @arg {Any} value                The value to check.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static assert_is_empty = function(_value, _onfailure) {
        if (is_string(_value))
            return assert_is_empty_string(_value, _onfailure);
        else if (is_array(_value))
            return assert_equal(0, array_length(_value), _onfailure ?? $"Expected an empty array, but got {array_length(_value)} items instead.");
        else if (is_struct(_value))
            return assert_equal(0, struct_names_count(_value), _onfailure ?? $"Expected an empty struct, but got {struct_names_count(_value)} entries instead.");
        else
            return assert_fail($"{_value} is a {typeof(_value)}; as neither a string, an array or a struct, it cannot be checked for emptiness.");
    }
    
    /// @func assert_count(expected,collection,[onfailure])
    /// @desc Asserts that a given collection has a given elements count. Applicable to arrays and structs only.
    /// @arg {Real} expected            The expected number of elements.
    /// @arg {Any} collection           The collection to check.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static assert_count = function(_expected, _collection, _onfailure) {
        if (is_array(_collection))
            return assert_equal(_expected, array_length(_collection), $"Expected a count of {_expected}, but got {array_length(_collection)} instead.");
        else if (is_struct(_collection))
            return assert_equal(_expected, struct_names_count(_collection), $"Expected a count of {_expected}, but got {struct_names_count(_collection)} instead.");
        else
            return assert_fail($"{_collection} is a {typeof(_collection)}; only collection types as array and struct can have count to check.");
    }
    
    /// @func assert_is_one_of(items,actual,[onfailure])
    /// @desc Asserts that a given value is equal to one of expected values.
    /// @arg {Array} items              The possible expected values.
    /// @arg {Any} actual               The actual value.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static assert_is_one_of = function(_items, _actual, _onfailure = undefined) {
        _onfailure ??= $"The value should be one of '{_items}' but is '{_actual}' instead.";
        return assert_that(array_contains(_items, _actual), _onfailure);
    }
    
    /// @func assert_struct_has_entry(struct,key,value,[onfailure])
    /// @desc Asserts that a given struct has the expected entry.
    /// @arg {Struct} struct            The struct to find the entry in.
    /// @arg {String} key               The key of the expected entry.
    /// @arg {Any} value                The value of the expected entry.
    /// @arg {String} [onfailure]       A custom message to show in case of a failure.
    static assert_struct_has_entry = function(_struct, _key, _value, _onfailure = undefined) {
        if (!struct_exists(_struct, _key))
            return assert_fail(_onfailure ?? $"The struct doesn't contain the expected entry '{_key}'.");
        else
            return assert_equal(_value, _struct[$ _key], _onfailure ?? $"The entry of '{_key}' should be '{_value}' but is '{_struct[$ _key]}' instead.");
    }
    
    #endregion
}