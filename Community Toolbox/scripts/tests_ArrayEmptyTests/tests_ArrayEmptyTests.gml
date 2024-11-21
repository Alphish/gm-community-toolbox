function ArrayEmptyTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    
    static test_subject = "array_empty";
    
    static should_treat_0_items_array_as_empty = function() {
        given_array([]);
        when_array_empty_checked();
        then_result_should_be_true();
    }
    
    static should_treat_1_items_array_as_empty = function() {
        given_array([1]);
        when_array_empty_checked();
        then_result_should_be_false();
    }
    
    static should_treat_3_items_array_as_empty = function() {
        given_array([2, 3, 4]);
        when_array_empty_checked();
        then_result_should_be_false();
    }
    
    // -----
    // Setup
    // -----
    
    array = undefined;
    result = undefined;
    
    static given_array = function(_array) {
        array = _array;
    }
    
    static when_array_empty_checked = function() {
        result = array_empty(array);
    }
    
    static then_result_should_be_true = function() {
        assert_equal(true, result);
    }
    
    static then_result_should_be_false = function() {
        assert_equal(false, result);
    }
}
