function IsConstructorTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "is_constructor(...)";
    
    static should_return_false_for_simple_function = function() {
        assert_is_false(is_constructor(ConstructorTests_SimpleFunction));
    }
    
    static should_return_true_for_simple_constructor = function() {
        assert_is_true(is_constructor(ConstructorTests_SimpleConstructor));
    }
    
    static should_return_true_for_parent_constructor = function() {
        assert_is_true(is_constructor(ConstructorTests_Parent));
    }
    
    static should_return_true_for_child_constructor = function() {
        assert_is_true(is_constructor(ConstructorTests_ChildA));
    }
    
    static should_return_true_for_grandchild_constructor = function() {
        assert_is_true(is_constructor(ConstructorTests_GrandchildC));
    }
    
    static should_return_true_for_outer_constructor = function() {
        assert_is_true(is_constructor(ConstructorTests_OuterConstructor));
    }
    
    // NOTE: only top-level constructors are tagged with @@constructor and @@parent=...
    // and there are no plans to extend the tags to inner constructors
    // see: https://github.com/YoYoGames/GameMaker-Bugs/issues/10317
    static should_return_false_for_inner_anonymous_constructor = function() {
        new ConstructorTests_OuterConstructor(); // ensuring the static struct has been initialised
        assert_is_false(is_constructor(ConstructorTests_OuterConstructor.ConstructorTests_InnerConstructor));
    }
    
    static should_return_false_for_simple_function_method = function() {
        var _method = method({}, ConstructorTests_SimpleFunction);
        assert_is_false(is_constructor(_method));
    }
    
    static should_return_true_for_simple_constructor_method = function() {
        var _method = method({}, ConstructorTests_SimpleConstructor);
        assert_is_true(is_constructor(_method));
    }
}
