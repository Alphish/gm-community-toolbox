// general note: since array_pop_random is non-deterministic
// the tests might technically pass even if there is an error by getting "lucky" with the RNG state;
// what should be guaranteed, is that as long as the function is implemented correctly, the tests pass every time

function ArrayPopRandomTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_pop_random";
    
    static should_return_undefined_for_empty_array = function() {
        given_array([]);
        when_array_pop_random_runs();
        then_result().should_be_undefined();
        then_source_array_length().should_be(0);
    }
    
    static should_pop_value_from_single_item_array = function() {
        given_array([42]);
        when_array_pop_random_runs();
        then_result().should_be(42);
        then_source_array_length().should_be(0);
    }
    
    static should_pop_value_from_multi_item_array = function() {
        given_array([100, 300, 500, 700, 900]);
        when_array_pop_random_runs();
        then_result().should_be_one_of([100, 300, 500, 700, 900]);
        then_source_array_length().should_be(4);
    }
    
    static should_pop_values_until_no_items_left = function() {
        given_array([100, 300, 500]);
        
        when_array_pop_random_runs();
        then_result().should_be_one_of([100, 300, 500]);
        then_source_array_length().should_be(2);
        
        when_array_pop_random_runs();
        then_result().should_be_one_of([100, 300, 500]);
        then_source_array_length().should_be(1);

        when_array_pop_random_runs();
        then_result().should_be_one_of([100, 300, 500]);
        then_source_array_length().should_be(0);

        when_array_pop_random_runs();
        then_result().should_be_undefined();
        then_source_array_length().should_be(0);
        
        then_popped_items_must_include(100, 300, 500);
    }
    
    static should_handle_offset_only = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset(2); // should take [500, 700, 900]
        when_array_pop_random_runs();
        then_result().should_be_one_of([500, 700, 900]);
        then_source_array_length().should_be(4);
    }
    
    static should_handle_positive_offset_and_length = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(2, 1); // should take [500]
        when_array_pop_random_runs();
        then_result().should_be(500);
        then_source_array_length().should_be(4);
    }
    
    static should_handle_negative_offset = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(-2, 1); // should_take [700]
        when_array_pop_random_runs();
        then_result().should_be(700);
        then_source_array_length().should_be(4);
    }
    
    static should_handle_negative_length = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(3, -3); // should take [700, 500, 300]
        when_array_pop_random_runs();
        then_result().should_be_one_of([300, 500, 700]);
        then_source_array_length().should_be(4);
    }
    
    static should_handle_zero_length_subsection = function() {
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(2, 0);
        when_array_pop_random_runs();
        then_result().should_be_undefined();
        then_source_array_length().should_be(5);
    }
    
    static should_pop_subsection_values_until_no_items_left = function() {
        // note: using an array-ending subsection for repeated popping tests
        // because otherwise the items after the subsection would enter the subsection range
        given_array([100, 300, 500, 700, 900]);
        given_offset_and_length(2, 3);
        
        when_array_pop_random_runs();
        then_result().should_be_one_of([500, 700, 900]);
        then_source_array_length().should_be(4);
        
        when_array_pop_random_runs();
        then_result().should_be_one_of([500, 700, 900]);
        then_source_array_length().should_be(3);

        when_array_pop_random_runs();
        then_result().should_be_one_of([500, 700, 900]);
        then_source_array_length().should_be(2);

        when_array_pop_random_runs();
        then_result().should_be_undefined();
        then_source_array_length().should_be(2);
        
        then_popped_items_must_include(500, 700, 900);
    }
    
    // -----
    // Setup
    // -----
    
    source_array = [];
    offset = undefined;
    length = undefined;
    result = undefined;
    popped_items = [];
    
    static given_array = function(_array) {
        source_array = _array;
    }
    
    static given_offset = function(_offset) {
        offset = _offset;
    }
    
    static given_offset_and_length = function(_offset, _length) {
        offset = _offset;
        length = _length;
    }
    
    static when_array_pop_random_runs = function() {
        result = array_pop_random(source_array, offset, length);
        array_push(popped_items, result);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
    
    static then_source_array_length = function() {
        return new VerrificNumericAssertion(test_asserter, array_length(source_array));
    }
    
    static then_popped_items_must_include = function() {
        for (var i = 0; i < argument_count; i++) {
            assert_that(array_contains(popped_items, argument[i]), $"Expected popped items to include {argument[i]}, but only {popped_items} were found.");
        }
    }
}
