// general note: since array_get_random is non-deterministic
// the tests might technically pass even if there is an error by getting "lucky" with the RNG state;
// what should be guaranteed, is that as long as the function is implemented correctly, the tests pass every time
// the repeated array_get_random calls are supposed to lower the risk of "lucky" bad passes

function ArrayGetRandomTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_get_random";
    
    static repetitions = 10;
    
    static should_return_undefined_for_empty_array = function() {
        given_array([]);
        when_array_get_random_runs();
        then_result().should_be_undefined();
    }
    
    static should_get_value_from_single_item_array = function() {
        given_array([42]);
        
        repeat (repetitions) {
            when_array_get_random_runs();
            then_result().should_be(42);
        }
    }
    
    static should_get_value_from_multi_item_array = function() {
        given_array([100, 300, 500, 700, 900]);
        repeat (repetitions) {
            when_array_get_random_runs();
            then_result().should_be_one_of([100, 300, 500, 700, 900]);
        }
    }
    
    static should_handle_offset_only = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset(2); // should take [500, 700, 900]
        repeat (repetitions) {
            when_array_get_random_runs();
            then_result().should_be_one_of([500, 700, 900]);
        }
    }
    
    static should_handle_positive_offset_and_length = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(1, 3); // should take [300, 500, 700]
        repeat (repetitions) {
            when_array_get_random_runs();
            then_result().should_be_one_of([300, 500, 700]);
        }
    }
    
    static should_handle_negative_offset = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(-2, 3); // should_take [700, 900]
        repeat (repetitions) {
            when_array_get_random_runs();
            then_result().should_be_one_of([700, 900]);
        }
    }
    
    static should_handle_negative_length = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(3, -3); // should take [700, 500, 300]
        repeat (repetitions) {
            when_array_get_random_runs();
            then_result().should_be_one_of([300, 500, 700]);
        }
    }
    
    static should_handle_zero_length_subsection = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(2, 0);
        when_array_get_random_runs();
        then_result().should_be_undefined();
    }
    
    static should_handle_one_length_subsection = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(2, 1); // should take [500]
        repeat (repetitions) {
            when_array_get_random_runs();
            then_result().should_be(500);
        }
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
    }
    
    static given_offset = function(_offset) {
        offset = _offset;
    }
    
    static given_offset_and_length = function(_offset, _length) {
        offset = _offset;
        length = _length;
    }
    
    static when_array_get_random_runs = function() {
        result = array_get_random(array, offset, length);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
