function StructAssignTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    
    static test_subject = "struct_assign";
    
    static should_assign_empty_struct_to_empty_struct = function() {
        given_destination({});
        given_source({});
        when_struct_assign_applied();
        then_destination_should_be_empty();
    }
    
    static should_assign_entries_struct_to_empty_struct = function() {
        given_destination({});
        given_source({ a: 1, b: 2, c: 3 });
        when_struct_assign_applied();
        then_destination_should_match({ a: 1, b: 2, c: 3 });
    }
    
    static should_assign_empty_struct_to_entries_struct = function() {
        given_destination({ a: 1, b: 2, c: 3 });
        given_source({});
        when_struct_assign_applied();
        then_destination_should_match({ a: 1, b: 2, c: 3 });
    }
    
    static should_assign_no_structs_to_entries_struct = function() {
        given_destination({ a: 1, b: 2, c: 3 });
        when_struct_assign_applied();
        then_destination_should_match({ a: 1, b: 2, c: 3 });
    }
    
    static should_fully_overwrite_entries_struct = function() {
        given_destination({ a: 1, b: 2, c: 3 });
        given_source({ a: 4, b: 5, c: 6 });
        when_struct_assign_applied();
        then_destination_should_match({ a: 4, b: 5, c: 6 });
    }
    
    static should_partially_overwrite_entries_struct = function() {
        given_destination({ a: 1, b: 2, c: 3 });
        given_source({ a: 4, d: 5, e: 6 });
        when_struct_assign_applied();
        then_destination_should_match({ a: 4, b: 2, c: 3, d: 5, e: 6 });
    }
    
    static should_assign_multiple_structs = function() {
        given_destination({ a: 1, b: 2, c: 3 });
        given_source({ a: 4, d: 5, e: 6 });
        given_source({ b: 7, f: 8, g: 9 });
        when_struct_assign_applied();
        then_destination_should_match({ a: 4, b: 7, c: 3, d: 5, e: 6, f: 8, g: 9 });
    }
    
    // -----
    // Setup
    // -----
    
    destination = undefined;
    sources = [];
    expected = undefined;
    
    static given_destination = function(_value) {
        destination = _value;
    }
    
    static given_source = function(_item) {
        array_push(sources, _item);
    }
    
    static when_struct_assign_applied = function() {
        var _args = [destination];
        array_copy(_args, 1, sources, 0, array_length(sources));
        script_execute_ext(struct_assign, _args);
    }
    
    static then_destination_should_be_empty = function() {
        assert_equal(0, struct_names_count(destination));
    }
    
    static then_destination_should_match = function(_expected) {
        expected = _expected;
        
        struct_foreach(expected, function(_key, _value) {
            assert_is_true(struct_exists(destination, _key), $"Expected '{_key}' entry to be present, but it's missing.");
        });
        
        struct_foreach(destination, function(_key, _value) {
            assert_is_true(struct_exists(expected, _key), $"Unexpected entry '{_key}'.");
        });
        
        struct_foreach(destination, function(_key, _value) {
            assert_equal(expected[$ _key], _value, $"The value of '{_key}' entry should be '{expected[$ _key]}', but got '{_value}' instead.");
        });
    }
}
