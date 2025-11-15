function ConstructorGetParentTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "constructor_get_parent(...)";
    
    static should_return_undefined_for_simple_function = function() {
        assert_is_undefined(constructor_get_parent(ConstructorTests_SimpleFunction));
    }
    
    static should_return_undefined_for_simple_constructor = function() {
        assert_is_undefined(constructor_get_parent(ConstructorTests_SimpleFunction));
    }
    
    static should_return_undefined_for_parent_constructor = function() {
        assert_is_undefined(constructor_get_parent(ConstructorTests_Parent));
    }
    
    static should_return_parent_for_child_constructor = function() {
        assert_equal(ConstructorTests_Parent, constructor_get_parent(ConstructorTests_ChildA));
    }
    
    static should_return_parent_for_grandchild_constructor = function() {
        assert_equal(ConstructorTests_ChildC, constructor_get_parent(ConstructorTests_GrandchildC));
    }
    
    static should_return_undefined_for_parent_constructor_method = function() {
        var _method = method({}, ConstructorTests_Parent);
        assert_is_undefined(constructor_get_parent(_method));
    }
    
    static should_return_parent_for_child_constructor_method = function() {
        var _method = method({}, ConstructorTests_ChildA);
        assert_equal(ConstructorTests_Parent, constructor_get_parent(_method));
    }
}
