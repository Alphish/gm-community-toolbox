function ConstructorCallTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "constructor_call(...)";
    
    static should_create_instance_of_simple_constructor = function() {
        var _result = constructor_call(ConstructorTests_SimpleConstructor);
        assert_result(_result, ConstructorTests_SimpleConstructor, {});
    }
    
    static should_create_instance_of_parent_constructor = function() {
        var _result = constructor_call(ConstructorTests_Parent);
        assert_result(_result, ConstructorTests_Parent, { parent_value: 123 });
    }
    
    static should_create_instance_of_child_constructor = function() {
        var _result = constructor_call(ConstructorTests_ChildA);
        assert_result(_result, ConstructorTests_ChildA, { parent_value: 123, child_value: 123 });
    }
    
    static should_create_instance_of_grandchild_constructor = function() {
        var _result = constructor_call(ConstructorTests_GrandchildC);
        assert_result(_result, ConstructorTests_GrandchildC, { parent_value: 123, child_value: 789, grandchild_value: 999 });
    }
    
    static should_create_instance_of_constructor_with_args = function() {
        var _result = constructor_call(ConstructorTests_ConstructorWithArgs, [ "aaa", "bbb", "ccc"]);
        assert_result(_result, ConstructorTests_ConstructorWithArgs, { first: "aaa", second: "bbb", third: "ccc" });
    }
    
    static should_create_instance_of_constructor_with_args_and_offset = function() {
        var _result = constructor_call(ConstructorTests_ConstructorWithArgs, [ "aaa", "bbb", "ccc", "ddd", "eee"], 2);
        assert_result(_result, ConstructorTests_ConstructorWithArgs, { first: "ccc", second: "ddd", third: "eee" });
    }
    
    static should_create_instance_of_constructor_with_args_slice = function() {
        var _result = constructor_call(ConstructorTests_ConstructorWithArgs, [ "aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg"], 3, 3);
        assert_result(_result, ConstructorTests_ConstructorWithArgs, { first: "ddd", second: "eee", third: "fff" });
    }
    
    static should_create_instance_of_other_constructor = function() {
        var _context = { value: "ipsum" };
        var _result;
        with (_context) {
            _result = constructor_call(ConstructorTests_OtherConstructor, ["lorem"]);
        }
        assert_result(_result, ConstructorTests_OtherConstructor, { own_value: "lorem", other_value: "ipsum" });
    }
    
    static should_create_instance_of_other_constructor_method = function() {
        var _context = { value: "ipsum" };
        var _method = method({ value: "dolor" }, ConstructorTests_OtherConstructor);
        var _result;
        with (_context) {
            _result = constructor_call(_method, ["lorem"]);
        }
        assert_result(_result, ConstructorTests_OtherConstructor, { own_value: "lorem", other_value: "dolor" });
    }
    
    // -------
    // Helpers
    // -------
    
    static assert_result = function(_instance, _constructor, _values) {
        assert_is_instanceof_struct(_constructor, _instance);
        assert_equal(struct_names_count(_values), struct_names_count(_instance));
        ensure_no_failure();
        
        var _names = struct_get_names(_values);
        for (var i = 0, _count = array_length(_names); i < _count; i++) {
            var _name = _names[i];
            if (!assert_is_true(struct_exists(_instance, _name), $"The struct should have '{_name}' member but didn't."))
                continue;
            
            assert_equal(_values[$ _name], _instance[$ _name]);
        }
    }
}
