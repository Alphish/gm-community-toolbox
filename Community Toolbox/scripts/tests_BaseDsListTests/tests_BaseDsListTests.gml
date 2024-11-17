function BaseDsListTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    // ----------------
    // Common functions
    // ----------------
    
    list = undefined;
    array = undefined;
    
    static test_cleanup = function() {
        if (!is_undefined(list) && ds_exists(list, ds_type_list))
            ds_list_destroy(list);
    }
    
    static given_empty_list = function() {
        list = ds_list_create();
    }
    
    static given_list_items = function() {
        list = ds_list_create();
        for (var i = 0; i < argument_count; i++) {
            ds_list_add(list, argument[i]);
        }
    }
    
    static given_empty_array = function() {
        array = [];
    }
    
    static given_array_items = function() {
        array = array_create(argument_count);
        for (var i = 0; i < argument_count; i++) {
            array[i] = argument[i];
        }
    }
    
    static then_list_should_be_empty = function() {
        assert_that(ds_list_empty(list), $"The list should be empty but isn't.");
    }
    
    static then_list_should_have_items = function() {
        if (!assert_equal(argument_count, ds_list_size(list), $"The new number of list items should be {argument_count} but is {ds_list_size(list)} instead."))
            return;
        
        for (var i = 0; i < argument_count; i++) {
            assert_equal(argument[i], list[| i], $"The list item #{i} should be '{argument[i]}' but is '{list[| i]}' instead.");
        }
    }
    
    static then_array_should_be_empty = function() {
        assert_equal(0, array_length(array), $"The array should be empty but isn't.");
    }
    
    static then_array_should_have_items = function() {
        if (!assert_equal(argument_count, array_length(array), $"The new number of array items should be {argument_count} but is {array_length(array)} instead."))
            return;
        
        for (var i = 0; i < argument_count; i++) {
            assert_equal(argument[i], array[i], $"The array item #{i} should be '{argument[i]}' but is '{array[i]}' instead.");
        }
    }
}
