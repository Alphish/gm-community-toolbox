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
}
