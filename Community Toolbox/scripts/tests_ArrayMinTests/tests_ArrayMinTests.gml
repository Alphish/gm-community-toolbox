function ArrayMinTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_min";
    
    // testing for especially large arrays,
    // because original script_execute_ext(...) implementation crashed on stack overflow with ~60k items,
    // so testing arrays/subsections with over ~65536 items should catch issues with naive script_execute_ext(...) implementation
    static array_with_100k_items = array_create_ext(100_000, function(i) { return i; });
    
    static should_handle_empty_array = function() {
        given_array([]);
        when_array_min_runs();
        then_result().should_be(0);
    }
    
    static should_handle_one_entry_array = function() {
        given_array([7]);
        when_array_min_runs();
        then_result().should_be(7);
    }
    
    static should_handle_multi_entry_array = function() {
        given_array([7, -5, 0, 10]);
        when_array_min_runs();
        then_result().should_be(-5);
    }
    
    static should_handle_large_array = function() {
        given_array(array_with_100k_items);
        when_array_min_runs();
        then_result().should_be(0);
    }
    
    static should_handle_positive_offset_and_length = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        given_offset_and_length(3, 4); // should take [4, 5, 6, 7]
        when_array_min_runs();
        then_result().should_be(4);
    }
    
    static should_handle_negative_offset = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        given_offset_and_length(-5, 3); // should take [6, 7, 8]
        when_array_min_runs();
        then_result().should_be(6);
    }
    
    static should_handle_negative_length = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        given_offset_and_length(5, -3); // should take [6, 5, 4]
        when_array_min_runs();
        then_result().should_be(4);
    }
    
    static should_handle_large_subsection = function() {
        given_array(array_with_100k_items);
        given_offset_and_length(20_000, 70_000); // should take [20000, 20001, ..., 89998, 89999]
        when_array_min_runs();
        then_result().should_be(20_000);
    }
    
    // -----
    // Setup
    // -----
    
    array = [];
    offset = 0;
    length = undefined;
    result = undefined;
    
    static given_array = function(_array) {
        array = _array;
    }
    
    static given_offset_and_length = function(_offset, _length) {
        offset = _offset;
        length = _length;
    }
    
    static when_array_min_runs = function() {
        result = array_min(array, offset, length);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
