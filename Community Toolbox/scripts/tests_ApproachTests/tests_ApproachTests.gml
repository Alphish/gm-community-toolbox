function ApproachTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "approach(...)";
    
    static should_increase_towards_target = function() {
        given_current_value(123);
        given_target_value(456);
        when_approach_performed();
        then_result().should_be(124);
    }
    
    static should_decrease_towards_target = function() {
        given_current_value(123);
        given_target_value(45);
        when_approach_performed();
        then_result().should_be(122);
    }
    
    static should_reach_greater_target_when_close_enough = function() {
        given_current_value(12.3);
        given_target_value(12.9);
        when_approach_performed();
        then_result().should_be(12.9);
    }
    
    static should_reach_smaller_target_when_close_enough = function() {
        given_current_value(12.3);
        given_target_value(11.9);
        when_approach_performed();
        then_result().should_be(11.9);
    }
    
    static should_return_target_when_same_as_current = function() {
        given_current_value(123);
        given_target_value(123);
        when_approach_performed();
        then_result().should_be(123);
    }
    
    static should_handle_large_step = function() {
        given_current_value(123);
        given_target_value(456);
        given_step(15);
        when_approach_performed();
        then_result().should_be(138);
    }
    
    static should_handle_negative_step = function() {
        given_current_value(123);
        given_target_value(456);
        given_step(-15);
        when_approach_performed();
        then_result().should_be(108);
    }
    
    // -----
    // Setup
    // -----
    
    current_value = undefined;
    target_value = undefined;
    step = 1;
    result = undefined;
    
    static given_current_value = function(_value) {
        current_value = _value;
    }
    
    static given_target_value = function(_value) {
        target_value = _value;
    }
    
    static given_step = function(_step) {
        step = _step;
    }
    
    static when_approach_performed = function() {
        result = approach(current_value, target_value, step);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
