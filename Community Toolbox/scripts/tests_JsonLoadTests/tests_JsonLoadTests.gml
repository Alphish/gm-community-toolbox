function JsonLoadTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "json_load";
    
    static should_handle_nonexistent_files = function() {
        var _expected = undefined;
        var _actual = json_load("testing/this_file_does_not_exist.txt");
        assert_equal(_expected, _actual, "json_load failed to handle nonexistent file!");
    }
    
    static should_handle_blank_file = function() {
        var _expected = undefined;
        var _actual = json_load("testing/testblank.txt");
        assert_equal(_expected, _actual, "json_load failed to handle blank file!");
    }
    
    static should_read_json_file_with_bool = function() {
        var _expected = bool(true);
        var _actual = json_load("testing/testbool.json");
        assert_equal(_expected, _actual, "json_load failed to handle JSON file with Boolean!");
    }
    
    static should_read_json_file_with_number = function() {
        var _expected = 583;
        var _actual = json_load("testing/testnumber.json");
        assert_equal(_expected, _actual, "json_load failed to handle JSON file with number!");
    }
    
    static should_read_json_file_with_string = function() {
        var _expected = "test string";
        var _actual = json_load("testing/teststring.json");
        assert_equal(_expected, _actual, "json_load failed to handle JSON file with string!");
    }
    
    static should_read_json_file_with_array = function() {
        var _expected = [
            "apples",
            "blackcurrants",
            "cherries",
        ];
        var _actual = json_load("testing/testarray.json");
        assert_that(array_equals(_expected, _actual), "json_load failed to handle JSON file with array!");
    }
    
    static should_read_json_file_with_struct = function() {
        var _expected = {
            foo: true,
            bar: 583,
            baz: "qux",
        };
        var _actual = json_load("testing/teststruct.json");
        assert_equal(_expected.foo, _actual.foo, "json_load failed to handle JSON file with struct!");
        assert_equal(_expected.bar, _actual.bar, "json_load failed to handle JSON file with struct!");
        assert_equal(_expected.baz, _actual.baz, "json_load failed to handle JSON file with struct!");
    }

    static should_read_json_struct_with_filter = function() {
        var _expected = {
            foo: true,
            bar: 1166,
            baz: "qux",
        };
		
		var _filter = function(_key, _value) {
			if (typeof(_value) == "number") {
				return _value * 2;
			} else {
				return _value;
			}
		}
		
        var _actual = json_load("testing/teststruct.json", _filter, false);
        assert_equal(_expected.foo, _actual.foo, "json_load failed to apply a filter properly!");
        assert_equal(_expected.bar, _actual.bar, "json_load failed to apply a filter properly!");
        assert_equal(_expected.baz, _actual.baz, "json_load failed to apply a filter properly!");
    }
	
	static should_read_json_int64_value_when_not_raw = function() {
		var _expected = 123456789123456789;
        var _actual = json_load("testing/testint64.json", undefined, false);
		assert_equal(_actual.bignumber, _expected, "json_load failed to parse int64 string into int64 when not raw!");
	}
	
	static should_read_json_int64_string_when_raw = function() {
		var _expected = "@i64@1b69b4bacd05f15$i64$";
        var _actual = json_load("testing/testint64.json", undefined, true);
		assert_equal(_actual.bignumber, _expected, "json_load failed to parse int64 string into int64 when not raw!");
	}
}
