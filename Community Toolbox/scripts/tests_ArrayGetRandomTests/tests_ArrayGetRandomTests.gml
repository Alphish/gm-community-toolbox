function ArrayGetRandomTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_get_random";

    static should_handle_empty_array = function() {
        given_array([]);
        when_array_get_random_runs();
        then_result().should_be(0);
    }
    
    static should_return_value_from_original_array = function() {
        given_array([100, 300, 500, 700, 900]);
        when_array_get_random_runs();
        then_result().should_be_one_of([100, 300, 500, 700, 900]);
    }
    
    static should_return_value_from_original_1_length_array = function() {
        given_array(["Hi"]);
        when_array_get_random_runs();
        then_string_result().should_be("Hi");
    }
    
    static should_respect_offset = function() {
        given_array([1,2,3,4,5,6,7,8,9,0]);
        given_offset(3);
        when_array_get_random_runs();
        then_result().should_be_one_of([4,5,6,7,8,9,0]);
    }
    
    static should_respect_length = function() {
        given_array([1,2,3,4,5,6,7,8,9,0]);
        given_length(4);
        when_array_get_random_runs();
        then_result().should_be_one_of([1,2,3,4]);
    }
    
    static should_respect_negative_offset = function() {
        given_array([1,2,3,4,5,6,7,8,9,0]);
        given_offset(-3);
        when_array_get_random_runs();
        then_result().should_be_one_of([8,9,0]);
    }
    
    static should_respect_negative_length = function() {
        given_array([1,2,3,4,5,6,7,8,9,0]);
        given_offset(5);
        given_length(-2);
        when_array_get_random_runs();
        then_result().should_be_one_of([5,6]);
    }
    
    static should_return_zero_for_zero_length = function() {
        given_array([1,2,3,4,5,6,7,8,9,0]);
        given_length(0);
        when_array_get_random_runs();
        then_result().should_be(0);
    }
    
    static should_respect_negative_offset_and_positive_length = function() {
        given_array([1,2,3,4,5,6,7,8,9,0]);
        given_offset(-5);
        given_length(4);
        when_array_get_random_runs();
        then_result().should_be_one_of([6,7,8,9]);
    }
    
 
    // -----
    // Setup
    // -----
    
    array = [];
    offset = undefined;
    length = undefined;
    result = undefined;
        
    static given_array = function(_array) {
        array = _array; 
        offset = undefined;
        length = undefined;
    }
    
    static given_offset = function(_offset) {
        offset = _offset;
    }
    
    static given_length = function(_length) {
        length = _length;        
    }
    
    static when_array_get_random_runs = function() {
        result = array_get_random(array, offset, length);
    }
        
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
    
    static then_string_result = function() {
        return new VerrificStringAssertion(test_asserter, result);
    }
}
