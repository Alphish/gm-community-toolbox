function StringToCharArrayTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "string_to_char_array";
    
    static should_handle_empty_string_zero_indexed = function() {
        given_source_string("");
        given_offset(false);
        when_converted_to_array();
        assert_that(array_equals(result, []), "string_to_char_array failed on empty string with 0 offset!");
    }
    
    static should_handle_one_character_string_zero_indexed = function() {
        given_source_string("b");
        given_offset(false);
        when_converted_to_array();
        assert_that(array_equals(result, ["b"]), "string_to_char_array failed on one-character string with 0 offset!");
    }
    
    static should_handle_multi_character_string_zero_indexed = function() {
        given_source_string("bar");
        given_offset(false);
        when_converted_to_array();
        assert_that(array_equals(result, ["b", "a", "r"]), "string_to_char_array failed on multi-character string with 0 offset!");
    };
    
    static should_handle_empty_string_one_indexed = function() {
        given_source_string("");
        given_offset(true);
        when_converted_to_array();
        assert_that(array_equals(result, [""]), "string_to_char_array failed on empty string with 1 offset!");
    }
    
    static should_handle_one_character_string_one_indexed = function() {
        given_source_string("b");
        given_offset(true);
        when_converted_to_array();
        assert_that(array_equals(result, ["", "b"]), "string_to_char_array failed on one-character string with 1 offset!");
    }
    
    static should_handle_multi_character_string_one_indexed = function() {
        given_source_string("bar");
        given_offset(true);
        when_converted_to_array();
        assert_that(array_equals(result, ["", "b", "a", "r"]), "string_to_char_array failed on multi-character string with 1 offset!");
    };
    
    // -----
    // Setup
    // -----
    
    source_string = 0;
    offset = false;
    result = 0;
    
    static given_source_string = function(_str) {
        source_string = _str;
    }
    
    static given_offset = function(_offset) {
        offset = _offset;
    }
    
    static when_converted_to_array = function() {
        result = string_to_char_array(source_string, offset);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
