function ArrayMedianTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_median";
    
    static should_handle_empty_array = function() {
        given_array([]);
        when_array_median_runs();
        then_result().should_be(0);
    }
    
    static should_handle_one_entry_array = function() {
        given_array([7]);
        when_array_median_runs();
        then_result().should_be(7);
    }
    
    static should_handle_even_entry_array = function() {
        //Implementation note: GM's median() takes higher of two middle entries
        given_array([5, -5, 3, 10]);
        when_array_median_runs();
        then_result().should_be(5);
    }
    
    static should_handle_odd_entry_array = function() {
        given_array([7, -5, 0, 3, 10]);
        when_array_median_runs();
        then_result().should_be(3);
    }
    
    // -----
    // Setup
    // -----
    
    array = [];
    result = undefined;
    
    static given_array = function(_array) {
        array = _array;
    }
    
    static when_array_median_runs = function() {
        result = array_median(array);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
