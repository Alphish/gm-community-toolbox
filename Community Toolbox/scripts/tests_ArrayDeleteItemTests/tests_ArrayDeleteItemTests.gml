function ArrayDeleteItemTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_delete_item";
    
    static should_not_delete_item_from_empty_array = function() {
        given_array([]);
        given_item_to_delete(123);
        
        when_array_item_deleted();
        then_array_should_have_items([]);
        then_result_should_be_false();
    }
    
    static should_delete_item_from_start = function() {
        given_array([123, 456, 789]);
        given_item_to_delete(123);
        
        when_array_item_deleted();
        then_array_should_have_items([456, 789]);
        then_result_should_be_true();
    }
    
    static should_delete_item_from_middle = function() {
        given_array([1, 2, 3, 4, 5]);
        given_item_to_delete(3);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 4, 5]);
        then_result_should_be_true();
    }
    
    static should_delete_item_from_end = function() {
        given_array([1, 2, 3, 4, 5]);
        given_item_to_delete(5);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4]);
        then_result_should_be_true();
    }
    
    static should_not_delete_item_if_none_exists = function() {
        given_array([12, 34, 56, 78]);
        given_item_to_delete(123);
        
        when_array_item_deleted();
        then_array_should_have_items([12, 34, 56, 78]);
        then_result_should_be_false();
    }
    
    static should_delete_items_one_by_one = function() {
        given_array([1, 0, 2, 3, 4, 0, 0, 5, 6, 7, 8, 9, 0]);
        given_item_to_delete(0);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 0, 0, 5, 6, 7, 8, 9, 0]);
        then_result_should_be_true();
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 0, 5, 6, 7, 8, 9, 0]);
        then_result_should_be_true();
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
        then_result_should_be_true();
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_true();
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_false();
    }
    
    static should_delete_item_in_start_segment = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(2);
        given_offset(0);
        given_length(3);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 3, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_true();
    }
    
    static should_not_delete_item_missing_in_start_segment = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(5);
        given_offset(0);
        given_length(3);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_false();
    }
    
    static should_delete_item_in_middle_segment = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(5);
        given_offset(3);
        given_length(3);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 6, 7, 8, 9]);
        then_result_should_be_true();
    }
    
    static should_not_delete_item_missing_in_middle_segment = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(7);
        given_offset(3);
        given_length(3);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_false();
    }
    
    static should_delete_item_in_end_segment = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(8);
        given_offset(6);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 9]);
        then_result_should_be_true();
    }
    
    static should_not_delete_item_missing_in_end_segment = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(4);
        given_offset(6);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_false();
    }
    
    static should_delete_item_in_3_last_items = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(8);
        given_offset(-3);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 9]);
        then_result_should_be_true();
    }
    
    static should_not_delete_item_missing_in_3_last_items = function() {
        given_array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        given_item_to_delete(4);
        given_offset(-3);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_false();
    }
    
    static should_delete_in_reverse_given_negative_length = function() {
        given_array([1, 2, 3, 0, 4, 5, 6, 0, 7, 8, 9]);
        given_item_to_delete(0);
        given_offset(-1);
        given_length(-11);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 0, 4, 5, 6, 7, 8, 9]);
        then_result_should_be_true();
    }
    
    static should_delete_last_item_in_reverse_deletion = function() {
        given_array([1, 2, 3, 0, 4, 5, 6, 0, 7, 8, 9, 0]);
        given_item_to_delete(0);
        given_offset(-1);
        given_length(-12);
        
        when_array_item_deleted();
        then_array_should_have_items([1, 2, 3, 0, 4, 5, 6, 0, 7, 8, 9]);
        then_result_should_be_true();
    }
    
    // -----
    // Setup
    // -----
    
    array = undefined;
    item = undefined;
    offset = undefined;
    length = undefined;
    result = undefined;
    
    static given_array = function(_array) {
        array = _array;
    }
    
    static given_item_to_delete = function(_item) {
        item = _item;
    }
    
    static given_offset = function(_offset) {
        offset = _offset;
    }
    
    static given_length = function(_length) {
        length = _length;
    }
    
    static when_array_item_deleted = function() {
        if (is_undefined(offset))
            result = array_delete_item(array, item);
        else if (is_undefined(length))
            result = array_delete_item(array, item, offset);
        else
            result = array_delete_item(array, item, offset, length);
    }
    
    static then_array_should_have_items = function(_expected) {
        assert_is_true(array_equals(_expected, array));
    }
    
    static then_result_should_be_true = function() {
        assert_is_true(result);
    }
    
    static then_result_should_be_false = function() {
        assert_is_false(result);
    }
}
