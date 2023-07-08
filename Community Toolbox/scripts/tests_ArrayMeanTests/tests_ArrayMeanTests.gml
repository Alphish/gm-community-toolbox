function ArrayMeanTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_mean";
    
    static should_handle_empty_array = function() {
        given_array([]);
        when_array_mean_runs();
        then_result().should_be(0);
    }
    
    static should_handle_one_entry_array = function() {
        given_array([7]);
        when_array_mean_runs();
        then_result().should_be(7);
    }
    
    static should_handle_multi_entry_array = function() {
        given_array([7, -5, 0, 10]);
        when_array_mean_runs();
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
    
    static when_array_mean_runs = function() {
        result = array_mean(array);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
