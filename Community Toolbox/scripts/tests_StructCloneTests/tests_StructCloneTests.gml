function StructCloneTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "struct_clone";
    
    static should_not_clone_nonstruct = function() {
        given_struct("totally a struct");
        try {
            when_struct_cloned();
            assert_fail("Exception should be thrown for attempting to clone a non-struct, but it wasn't.");
        } catch (e) {
            assert_pass();
        }
    }
    
    static should_clone_empty_struct = function() {
        given_struct({});
        when_struct_cloned();
        then_clone_should_not_be_given();
        then_result().should_be_empty();
    }
    
    static should_clone_flat_array = function() {
        given_struct({ one: "lorem", two: "ipsum", three: "dolor" });
        when_struct_cloned();
        then_clone_should_not_be_given();
        then_result()
            .should_have_entry("one", "lorem")
            .should_have_entry("two", "ipsum")
            .should_have_entry("three", "dolor");
    }
    
    static should_shallow_clone_by_default = function() {
        given_struct({ one: "lorem", two: "ipsum", three: { a: 12, b: 34, c: [5, 6, 7] }, four: ["dolor", "sit"] });
        when_struct_cloned();
        then_clone_should_not_be_given();
        then_result().should_equal_struct(given);
    }
    
    static should_shallow_clone_when_requested = function() {
        given_struct({ one: "lorem", two: "ipsum", three: { a: 12, b: 34, c: [5, 6, 7] }, four: ["dolor", "sit"] });
        given_shallow_cloning();
        when_struct_cloned();
        then_clone_should_not_be_given();
        then_result().should_equal_struct(given);
    }
    
    static should_deep_clone_when_requested = function() {
        given_struct({ one: "lorem", two: "ipsum", three: { a: 12, b: 34, c: [5, 6, 7] }, four: ["dolor", "sit"] });
        given_deep_cloning();
        when_struct_cloned();
        then_clone_should_not_be_given();
        
        assert_that(given.one == clone.one, "First primitive items should be equal");
        assert_that(given.two == clone.two, "Second primitive items should be equal");
        
        assert_that(given.three != clone.three, "Third nested structs should not be equal");
        assert_that(given.three.a == clone.three.a, "Nested struct primitive entry 'a' should be equal");
        assert_that(given.three.b == clone.three.b, "Nested struct primitive entry 'b' should be equal");
        assert_that(given.three.c != clone.three.c, "Nested struct array entry 'c' should not be equal");
        assert_array_equal(given.three.c, clone.three.c);
        
        assert_that(given.four != clone.four, "Fourth nested arrays should not be equal");
        assert_array_equal(given.four, clone.four);
    }
    
    // -----
    // Setup
    // -----
    
    given = undefined;
    deep = undefined;
    clone = undefined;
    
    static given_struct = function(_array) {
        given = _array;
    }
    
    static given_shallow_cloning = function() {
        deep = false;
    }
    
    static given_deep_cloning = function() {
        deep = true;
    }
    
    static when_struct_cloned = function() {
        if (is_undefined(deep))
            clone = struct_clone(given);
        else
            clone = struct_clone(given, deep);
    }
    
    static then_clone_should_not_be_given = function() {
        assert_that(clone != given, $"Clone should be a different entity from the given struct, but isn't.");
    }
    
    static then_result = function() {
        return new VerrificStructAssertion(test_asserter, clone);
    }
}
