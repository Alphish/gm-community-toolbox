function StructFilterTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "struct_filter";
    
    static should_filter_empty_struct_into_empty_struct = function() {
        given_source({});
        given_predicate(function(_key, _value) { return true; });
        when_struct_filtered();
        then_result().should_equal_struct({});
    }
    
    static should_get_equivalent_struct_given_always_true_filter = function() {
        given_source({ lorem: 123, ipsum: 456, dolor: 789 });
        given_predicate(function(_key, _value) { return true; });
        when_struct_filtered();
        then_result().should_equal_struct({ lorem: 123, ipsum: 456, dolor: 789 });
    }
    
    static should_get_empty_struct_given_always_false_filter = function() {
        given_source({ lorem: 123, ipsum: 456, dolor: 789 });
        given_predicate(function(_key, _value) { return false; });
        when_struct_filtered();
        then_result().should_equal_struct({});
    }
    
    static should_correctly_filter_by_key = function() {
        given_source({ lorem: 123, ipsum: 456, dolor: 789 });
        given_predicate(function(_key, _value) { return string_contains(_key, "o"); });
        when_struct_filtered();
        then_result().should_equal_struct({ lorem: 123, dolor: 789 });
    }
    
    static should_correctly_filter_by_value = function() {
        given_source({ lorem: 123, ipsum: 456, dolor: 789 });
        given_predicate(function(_key, _value) { return _value > 300; });
        when_struct_filtered();
        then_result().should_equal_struct({ ipsum: 456, dolor: 789 });
    }
    
    static should_correctly_filter_by_key_and_value = function() {
        given_source({ lorem: 123, ipsum: 456, dolor: 789 });
        given_predicate(function(_key, _value) { return string_contains(_key, "o") && _value > 300; });
        when_struct_filtered();
        then_result().should_equal_struct({ dolor: 789 });
    }
    
    // -----
    // Setup
    // -----
    
    source = undefined;
    predicate = undefined;
    result = undefined;
    
    static given_source = function(_value) {
        source = _value;
    }
    
    static given_predicate = function(_predicate) {
        predicate = _predicate;
    }
    
    static when_struct_filtered = function() {
        result = struct_filter(source, predicate);
    }
    
    static then_result = function() {
        return new VerrificStructAssertion(test_asserter, result);
    }
}
