function StaticInitTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "static_init(...)";
    
    static should_initialize_some_function = function() {
        var _static = static_get(StaticInitTests_SomeFunction);
        if (struct_exists(_static, "test_completed")) {
            assert_pass();
            return;
        }
        
        if (struct_names_count(_static) > 0)
            return finish_unsure("The function seems to have been initialized outside of the test.");
        
        static_init(StaticInitTests_SomeFunction);
        
        assert_equal(StaticInitTests_SomeFunction.static_value, "lorem");
        StaticInitTests_SomeFunction.test_completed = true;
    }
    
    static should_initialize_some_constructor = function() {
        var _static = static_get(StaticInitTests_SomeConstructor);
        if (struct_exists(_static, "test_completed")) {
            assert_pass();
            return;
        }
        
        if (struct_names_count(_static) > 0)
            return finish_unsure("The function seems to have been initialized outside of the test.");
        
        static_init(StaticInitTests_SomeConstructor);
        
        assert_equal(StaticInitTests_SomeConstructor.static_value, "ipsum");
        StaticInitTests_SomeConstructor.test_completed = true;
    }
    
    static should_initialize_parent_and_child = function() {
        var _static = static_get(StaticInitTests_SomeChild);
        if (struct_exists(_static, "test_completed")) {
            assert_pass();
            return;
        }
        
        if (struct_names_count(_static) > 0)
            return finish_unsure("The function seems to have been initialized outside of the test.");
        
        static_init(StaticInitTests_SomeChild);
        
        assert_equal(StaticInitTests_SomeParent.static_value, "dolor");
        assert_equal(StaticInitTests_SomeChild.static_value, "sit");
        StaticInitTests_SomeChild.test_completed = true;
    }
    
    static should_throw_error_when_instance_logic_detected = function() {
        var _static = static_get(StaticInitTests_SomeMistake);
        if (struct_exists(_static, "test_completed")) {
            assert_pass();
            return;
        }
        
        if (struct_names_count(_static) > 0)
            return finish_unsure("The function seems to have been initialized outside of the test.");
        
        try {
            static_init(StaticInitTests_SomeMistake);
            assert_fail("Expected instance variable assignment during static initialization to cause an error, but none was found.");
        } catch (_exception) {
            assert_pass();
        }
        
        assert_equal(StaticInitTests_SomeMistake.static_value, "amet");
        StaticInitTests_SomeMistake.test_completed = true;
    }
}

// -----------------
// Functions to test
// -----------------

function StaticInitTests_SomeFunction() {
    static static_value = "lorem";
    
    if (static_init_in_progress()) exit;
    instance_value = 123;
}

function StaticInitTests_SomeConstructor() constructor {
    static static_value = "ipsum";
    
    if (static_init_in_progress()) exit;
    instance_value = 456;
}

function StaticInitTests_SomeParent() constructor {
    static static_value = "dolor";
    
    if (static_init_in_progress()) exit;
    instance_value = 789;
}

function StaticInitTests_SomeChild() : StaticInitTests_SomeParent() constructor {
    static static_value = "sit";
    
    if (static_init_in_progress()) exit;
    instance_value = 012;
}

function StaticInitTests_SomeMistake() constructor {
    static static_value = "amet";
    
    instance_value = 345;
}
