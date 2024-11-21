function StringContainsTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "string_contains";
    
    static should_accept_empty_string_in_empty_string = function() {
        given_empty_haystack();
        given_empty_needle();
        when_checked();
        then_result_should_be_true();
    }
    
    static should_accept_empty_string_in_lorem = function() {
        given_haystack("lorem");
        given_empty_needle();
        when_checked();
        then_result_should_be_true();
    }
    
    static should_reject_ipsum_in_empty_string = function() {
        given_empty_haystack();
        given_needle("ipsum");
        when_checked();
        then_result_should_be_false();
    }
    
    static should_reject_ipsum_in_lorem = function() {
        given_haystack("lorem");
        given_needle("ipsum");
        when_checked();
        then_result_should_be_false();
    }
    
    static should_accept_lorem_in_phrase = function() {
        given_haystack("lorem ipsum dolor");
        given_needle("lorem");
        when_checked();
        then_result_should_be_true();
    }
    
    static should_accept_ipsum_in_phrase = function() {
        given_haystack("lorem ipsum dolor");
        given_needle("ipsum");
        when_checked();
        then_result_should_be_true();
    }
    
    static should_accept_dolor_in_phrase = function() {
        given_haystack("lorem ipsum dolor");
        given_needle("dolor");
        when_checked();
        then_result_should_be_true();
    }
    
    static should_not_match_different_case = function() {
        given_haystack("lorem ipsum dolor");
        given_needle("IPSUM");
        when_checked();
        then_result_should_be_false();
    }
    
    // -----
    // Setup
    // -----
    
    haystack = undefined;
    needle = undefined;
    result = undefined;
    
    static given_haystack = function(_str) {
        haystack = _str;
    }
    
    static given_empty_haystack = function() {
        given_haystack("");
    }
    
    static given_needle = function(_offset) {
        needle = _offset;
    }
    
    static given_empty_needle = function() {
        given_needle("");
    }
    
    static when_checked = function() {
        result = string_contains(haystack, needle);
    }
    
    static then_result_should_be_true = function() {
        assert_equal(true, result);
    }
    
    static then_result_should_be_false = function() {
        assert_equal(false, result);
    }
}
