function ConstructorGetChildrenTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "constructor_get_children(...)";
    
    static should_return_undefined_for_simple_function = function() {
        assert_is_undefined(constructor_get_children(ConstructorTests_SimpleFunction));
    }
    
    static should_return_empty_array_for_simple_constructor = function() {
        var _result = constructor_get_children(ConstructorTests_SimpleConstructor);
        assert_is_array(_result);
        assert_equal(0, array_length(_result));
    }
    
    static should_return_children_for_parent_constructor = function() {
        var _result = constructor_get_children(ConstructorTests_Parent);
        assert_is_array(_result);
        assert_equal(3, array_length(_result));
        ensure_no_failure();
        
        assert_is_true(array_contains(_result, ConstructorTests_ChildA));
        assert_is_true(array_contains(_result, ConstructorTests_ChildB));
        assert_is_true(array_contains(_result, ConstructorTests_ChildC));
    }
    
    static should_return_empty_array_for_one_child_constructor = function() {
        var _result = constructor_get_children(ConstructorTests_ChildA);
        assert_is_array(_result);
        assert_equal(0, array_length(_result));
    }
    
    static should_return_grandchildren_for_other_child_constructor = function() {
        var _result = constructor_get_children(ConstructorTests_ChildC);
        assert_is_array(_result);
        assert_equal(1, array_length(_result));
        ensure_no_failure();
        
        assert_is_true(array_contains(_result, ConstructorTests_GrandchildC));
    }
    
    static should_return_empty_array_for_grandchild_constructor = function() {
        var _result = constructor_get_children(ConstructorTests_GrandchildC);
        assert_is_array(_result);
        assert_equal(0, array_length(_result));
    }
    
    static should_return_undefined_for_simple_function_method = function() {
        var _method = method({}, ConstructorTests_SimpleFunction);
        assert_is_undefined(constructor_get_children(_method));
    }
    
    static should_return_empty_array_for_simple_constructor_method = function() {
        var _method = method({}, ConstructorTests_SimpleConstructor);
        var _result = constructor_get_children(_method);
        assert_is_array(_result);
        assert_equal(0, array_length(_result));
    }
    
    static should_return_children_for_parent_constructor_method = function() {
        var _method = method({}, ConstructorTests_Parent);
        var _result = constructor_get_children(_method);
        assert_is_array(_result);
        assert_equal(3, array_length(_result));
        ensure_no_failure();
        
        assert_is_true(array_contains(_result, ConstructorTests_ChildA));
        assert_is_true(array_contains(_result, ConstructorTests_ChildB));
        assert_is_true(array_contains(_result, ConstructorTests_ChildC));
    }
}
