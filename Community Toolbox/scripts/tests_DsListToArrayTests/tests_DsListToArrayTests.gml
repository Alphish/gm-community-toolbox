function DsListToArrayTests(_run, _method) : BaseDsListTests(_run, _method) constructor {
    static test_subject = "ds_list_to_array";
    
    static should_create_from_empty_list = function() {
        given_empty_list();
        when_array_created();
        then_list_should_be_empty();
        then_array_should_be_empty();
    }
    
    static should_create_from_list_items = function() {
        given_list_items(1, 2, 3);
        when_array_created();
        then_list_should_have_items(1, 2, 3);
        then_array_should_have_items(1, 2, 3);
    }
    
    // -----
    // Setup
    // -----
    
    static when_array_created = function() {
        array = ds_list_to_array(list);
    }
}
