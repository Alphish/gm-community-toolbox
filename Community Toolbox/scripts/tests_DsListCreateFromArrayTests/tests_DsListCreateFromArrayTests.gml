function DsListCreateFromArrayTests(_run, _method) : BaseDsListTests(_run, _method) constructor {
    static test_subject = "ds_list_create_from_array";
    
    static should_create_from_empty_array = function() {
        given_empty_array();
        when_list_created();
        then_list_should_be_empty();
        then_array_should_be_empty();
    }
    
    static should_create_from_array_items = function() {
        given_array_items(4, 5, 6);
        when_list_created();
        then_list_should_have_items(4, 5, 6);
        then_array_should_have_items(4, 5, 6);
    }
    
    // -----
    // Setup
    // -----
    
    static when_list_created = function() {
        list = ds_list_create_from_array(array);
    }
}
