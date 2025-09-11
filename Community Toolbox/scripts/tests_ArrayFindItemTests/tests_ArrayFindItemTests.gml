function ArrayFindItemTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_find_item";
    
    static should_not_find_item_in_empty_array = function() {
        given_array([]);
        given_negative_predicate();
        
        when_array_searched();
        then_item_should_not_be_found();
    }
    
    static should_find_matching_item_at_start = function() {
        given_array([-3, 7, -2, 79, -12]);
        given_negative_predicate();
        
        when_array_searched();
        then_found_item_should_be(-3);
    }
    
    static should_find_matching_item_in_the_middle = function() {
        given_array([3, -7, 2, -79, 12]);
        given_negative_predicate();
        
        when_array_searched();
        then_found_item_should_be(-7);
    }
    
    static should_find_matching_item_at_the_end = function() {
        given_array([3, 7, 2, 79, -12]);
        given_negative_predicate();
        
        when_array_searched();
        then_found_item_should_be(-12);
    }
    
    static should_not_find_match_if_none_exists = function() {
        given_array([3, 7, 2, 79, 12]);
        given_negative_predicate();
        
        when_array_searched();
        then_item_should_not_be_found();
    }
    
    static should_find_matching_item_in_start_segment = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "ADIPISCING", "elit"]);
        given_all_uppercase_predicate();
        given_offset(0);
        given_length(3);
        
        when_array_searched();
        then_found_item_should_be("DOLOR");
    }
    
    static should_not_find_start_segment_match = function() {
        given_array(["Lorem", "ipsum", "dolor", "sit", "AMET", "consectetur", "ADIPISCING", "elit"]);
        given_all_uppercase_predicate();
        given_offset(0);
        given_length(3);
        
        when_array_searched();
        then_item_should_not_be_found();
    }
    
    static should_find_matching_item_in_middle_segment = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "ADIPISCING", "elit"]);
        given_all_uppercase_predicate();
        given_offset(3);
        given_length(3);
        
        when_array_searched();
        then_found_item_should_be("AMET");
    }
    
    static should_not_find_middle_segment_match = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "amet", "consectetur", "ADIPISCING", "elit"]);
        given_all_uppercase_predicate();
        given_offset(3);
        given_length(3);
        
        when_array_searched();
        then_item_should_not_be_found();
    }
    
    static should_find_matching_item_in_end_segment = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "ADIPISCING", "elit"]);
        given_all_uppercase_predicate();
        given_offset(6);
        
        when_array_searched();
        then_found_item_should_be("ADIPISCING");
    }
    
    static should_not_find_end_segment_match = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "adipiscing", "elit"]);
        given_all_uppercase_predicate();
        given_offset(6);
        
        when_array_searched();
        then_item_should_not_be_found();
    }
    
    static should_find_matching_item_in_3_last_items = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "ADIPISCING", "elit"]);
        given_all_uppercase_predicate();
        given_offset(-3);
        
        when_array_searched();
        then_found_item_should_be("ADIPISCING");
    }
    
    static should_not_find_3_last_items_match = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "adipiscing", "elit"]);
        given_all_uppercase_predicate();
        given_offset(-3);
        
        when_array_searched();
        then_item_should_not_be_found();
    }
    
    static should_search_in_reverse_given_negative_length = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "adipiscing", "elit"]);
        given_all_uppercase_predicate();
        given_offset(-1);
        given_length(-8);
        
        when_array_searched();
        then_found_item_should_be("AMET");
    }
    
    static should_find_last_item_in_reverse_search = function() {
        given_array(["Lorem", "ipsum", "DOLOR", "sit", "AMET", "consectetur", "adipiscing", "ELIT"]);
        given_all_uppercase_predicate();
        given_offset(-1);
        given_length(-8);
        
        when_array_searched();
        then_found_item_should_be("ELIT");
    }
    
    // -----
    // Setup
    // -----
    
    array = undefined;
    predicate = undefined;
    offset = undefined;
    length = undefined;
    found_item = undefined;
    
    static given_array = function(_array) {
        array = _array;
    }
    
    static given_all_uppercase_predicate = function() {
        predicate = function(_str) {
            return _str == string_upper(_str);
        };
    }
    
    static given_negative_predicate = function() {
        predicate = function(_num) {
            return _num < 0;
        };
    }
    
    static given_offset = function(_offset) {
        offset = _offset;
    }
    
    static given_length = function(_length) {
        length = _length;
    }
    
    static when_array_searched = function() {
        if (is_undefined(offset))
            found_item = array_find_item(array, predicate);
        else if (is_undefined(length))
            found_item = array_find_item(array, predicate, offset);
        else
            found_item = array_find_item(array, predicate, offset, length);
    }
    
    static then_item_should_not_be_found = function() {
        assert_is_undefined(found_item);
    }
    
    static then_found_item_should_be = function(_expected) {
        assert_equal(_expected, found_item);
    }
}
