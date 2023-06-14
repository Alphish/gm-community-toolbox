function IsDefinedTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "is_defined";
    
    static should_return_false_for_undefined = function() {
        assert_is_false(is_defined(undefined));
    }
    
    static should_return_false_for_null = function() {
        assert_is_false(is_defined(pointer_null));
    }
    
    static should_return_true_for_zero = function() {
        assert_is_true(is_defined(0));
    }
    
    static should_return_true_for_minus_one = function() {
        assert_is_true(is_defined(-1));
    }
    
    static should_return_true_for_empty_string = function() {
        assert_is_true(is_defined(""));
    }
    
    static should_return_true_for_nonempty_string = function() {
        assert_is_true(is_defined("hello"));
    }
}
