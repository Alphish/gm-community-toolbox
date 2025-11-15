function IsNonemptyStringTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    
    static test_subject = "is_nonempty_string";
    
    static should_be_false_for_undefined = function() {
        given_value(undefined);
        when_nonempty_string_checked();
        then_result_should_be_false();
    }
    
    static should_be_false_for_number = function() {
        given_value(123);
        when_nonempty_string_checked();
        then_result_should_be_false();
    }
    
    static should_be_false_for_empty_string = function() {
        given_value("");
        when_nonempty_string_checked();
        then_result_should_be_false();
    }
    
    static should_be_true_for_single_character_string = function() {
        given_value("!");
        when_nonempty_string_checked();
        then_result_should_be_true();
    }
    
    static should_be_true_for_multi_character_string = function() {
        given_value("Lorem");
        when_nonempty_string_checked();
        then_result_should_be_true();
    }
    
    // -----
    // Setup
    // -----
    
    value = undefined;
    result = undefined;
    
    static given_value = function(_value) {
        value = _value;
    }
    
    static when_nonempty_string_checked = function() {
        result = is_nonempty_string(value);
    }
    
    static then_result_should_be_true = function() {
        assert_equal(true, result);
    }
    
    static then_result_should_be_false = function() {
        assert_equal(false, result);
    }
}
