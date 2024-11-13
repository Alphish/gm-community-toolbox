function DsListAddToArrayTests(_run, _method) : BaseDsListTests(_run, _method) constructor {
    static test_subject = "ds_list_add_to_array";
    
    static should_handle_empty_list_and_array = function() {
        given_empty_list();
        given_empty_array();
        when_items_added_to_array();
        then_list_should_be_empty();
        then_array_should_be_empty();
    }
    
    static should_handle_empty_list_and_array_items = function() {
        given_empty_list();
        given_array_items(4, 5, 6);
        when_items_added_to_array();
        then_list_should_have_items();
        then_array_should_have_items(4, 5, 6);
    }
    
    static should_handle_list_items_and_empty_array = function() {
        given_list_items(1, 2, 3);
        given_empty_array();
        when_items_added_to_array();
        then_list_should_have_items(1, 2, 3);
        then_array_should_have_items(1, 2, 3);
    }
    
    static should_handle_list_and_array_items = function() {
        given_list_items(1, 2, 3);
        given_array_items(4, 5, 6);
        when_items_added_to_array();
        then_list_should_have_items(1, 2, 3);
        then_array_should_have_items(4, 5, 6, 1, 2, 3);
    }
    
    // -----
    // Setup
    // -----
    
    static when_items_added_to_array = function() {
        ds_list_add_to_array(list, array);
    }
}
