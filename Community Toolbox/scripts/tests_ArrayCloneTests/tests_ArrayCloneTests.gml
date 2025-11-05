function ArrayCloneTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_clone";
    
    static should_not_clone_nonarray = function() {
        given_array("totally an array");
        try {
            when_array_cloned();
            assert_fail("Exception should be thrown for attempting to clone a non-array, but it wasn't.");
        } catch (e) {
            assert_pass();
        }
    }
    
    static should_clone_empty_array = function() {
        given_array([]);
        when_array_cloned();
        then_clone_should_not_be_given();
        then_result().should_be_empty();
    }
    
    static should_clone_flat_array = function() {
        given_array(["lorem", "ipsum", "dolor"]);
        when_array_cloned();
        then_clone_should_not_be_given();
        then_result().should_equal_items("lorem", "ipsum", "dolor");
    }
    
    static should_shallow_clone_by_default = function() {
        given_array(["lorem", "ipsum", { a: 12, b: 34, c: [5, 6, 7] }, ["dolor", "sit"]]);
        when_array_cloned();
        then_clone_should_not_be_given();
        then_result().should_equal_array(given);
    }
    
    static should_shallow_clone_when_requested = function() {
        given_array(["lorem", "ipsum", { a: 12, b: 34, c: [5, 6, 7] }, ["dolor", "sit"]]);
        given_shallow_cloning();
        when_array_cloned();
        then_clone_should_not_be_given();
        then_result().should_equal_array(given);
    }
    
    static should_deep_clone_when_requested = function() {
        given_array(["lorem", "ipsum", { a: 12, b: 34, c: [5, 6, 7] }, ["dolor", "sit"]]);
        given_deep_cloning();
        when_array_cloned();
        then_clone_should_not_be_given();
        
        assert_that(given[0] == clone[0], "First primitive items should be equal");
        assert_that(given[1] == clone[1], "Second primitive items should be equal");
        
        assert_that(given[2] != clone[2], "Third nested structs should not be equal");
        assert_that(given[2].a == clone[2].a, "Nested struct primitive entry 'a' should be equal");
        assert_that(given[2].b == clone[2].b, "Nested struct primitive entry 'b' should be equal");
        assert_that(given[2].c != clone[2].c, "Nested struct array entry 'c' should not be equal");
        assert_array_equal(given[2].c, clone[2].c);
        
        assert_that(given[3] != clone[3], "Fourth nested arrays should not be equal");
        assert_array_equal(given[3], clone[3]);
    }
    
    // -----
    // Setup
    // -----
    
    given = undefined;
    deep = undefined;
    clone = undefined;
    
    static given_array = function(_array) {
        given = _array;
    }
    
    static given_shallow_cloning = function() {
        deep = false;
    }
    
    static given_deep_cloning = function() {
        deep = true;
    }
    
    static when_array_cloned = function() {
        if (is_undefined(deep))
            clone = array_clone(given);
        else
            clone = array_clone(given, deep);
    }
    
    static then_clone_should_not_be_given = function() {
        assert_that(clone != given, $"Clone should be a different entity from the given array, but isn't.");
    }
    
    static then_result = function() {
        return new VerrificArrayAssertion(test_asserter, clone);
    }
}
