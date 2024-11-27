function ArrayClearTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_clear";
    
    static should_clear_0_items_array = function() {
        given_array([]);
        when_array_clear_applied();
        then_array_should_be_empty();
    }
    
    static should_clear_1_items_array = function() {
        given_array([1]);
        when_array_clear_applied();
        then_array_should_be_empty();
    }
    
    static should_clear_3_items_array = function() {
        given_array([2, 3, 4]);
        when_array_clear_applied();
        then_array_should_be_empty();
    }
    
    // -----
    // Setup
    // -----
    
    array = undefined;
    
    static given_array = function(_array) {
        array = _array;
    }
    
    static when_array_clear_applied = function() {
        array_clear(array);
    }
    
    static then_array_should_be_empty = function() {
        assert_equal(0, array_length(array));
    }
}
