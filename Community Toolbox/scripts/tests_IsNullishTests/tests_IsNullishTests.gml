function IsNullishTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "is_nullish";
    
    static should_return_true_for_undefined = function() {
        assert_is_true(is_nullish(undefined));
    }
    
    static should_return_true_for_null = function() {
        assert_is_true(is_nullish(pointer_null));
    }
    
    static should_return_false_for_zero = function() {
        assert_is_false(is_nullish(0));
    }
    
    static should_return_false_for_minus_one = function() {
        assert_is_false(is_nullish(-1));
    }
    
    static should_return_false_for_empty_string = function() {
        assert_is_false(is_nullish(""));
    }
    
    static should_return_false_for_nonempty_string = function() {
        assert_is_false(is_nullish("hello"));
    }
}
