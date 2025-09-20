function IsNonemptyStructTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    
    static test_subject = "is_nonempty_struct";
    
    static should_be_false_for_undefined = function() {
        given_value(undefined);
        when_nonempty_struct_checked();
        then_result_should_be_false();
    }
    
    static should_be_false_for_number = function() {
        given_value(123);
        when_nonempty_struct_checked();
        then_result_should_be_false();
    }
    
    static should_be_false_for_empty_struct = function() {
        given_value({});
        when_nonempty_struct_checked();
        then_result_should_be_false();
    }
    
    static should_be_true_for_single_entry_struct = function() {
        given_value({ whatever: "etc" });
        when_nonempty_struct_checked();
        then_result_should_be_true();
    }
    
    static should_be_true_for_multi_entry_struct = function() {
        given_value({ lorem: 123, ipsum: 456, dolor: 789 });
        when_nonempty_struct_checked();
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
    
    static when_nonempty_struct_checked = function() {
        result = is_nonempty_struct(value);
    }
    
    static then_result_should_be_true = function() {
        assert_equal(true, result);
    }
    
    static then_result_should_be_false = function() {
        assert_equal(false, result);
    }
}
