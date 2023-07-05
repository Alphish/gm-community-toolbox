function ApproachAngleTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "approach_angle(...)";
    
    static should_handle_zero_difference = function() {
        given_angle_from(123);
        given_angle_to(123);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(123);
    }
    
    static should_correctly_go_counterclockwise_without_crossing_zero = function() {
        given_angle_from(30);
        given_angle_to(150);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(31);
    }
    
    static should_correctly_go_clockwise_without_crossing_zero = function() {
        given_angle_from(330);
        given_angle_to(210);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(329);
    }
    
    static should_correctly_go_counterclockwise_while_crossing_zero = function() {
        given_angle_from(350);
        given_angle_to(10);
        given_step(15);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(5);
    }
    
    static should_correctly_go_clockwise_while_crossing_zero = function() {
        given_angle_from(10);
        given_angle_to(350);
        given_step(15);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(355);
    }
    
    static should_land_at_zero = function() {
        given_angle_from(10);
        given_angle_to(350);
        given_step(10);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(0);
    }
    
    static should_handle_superpositive_angles = function() {
        given_angle_from(3630); // equivalent to 30
        given_angle_to(7260); // equivalent to 60
        given_step(10);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(40);
    }
    
    static should_handle_supernegative_angles = function() {
        given_angle_from(-3630); // equivalent to -30 or 330
        given_angle_to(-7260); // equivalent to -60 or 300
        given_step(10);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(320);
    }
    
    static should_handle_negative_step = function() {
        given_angle_from(90);
        given_angle_to(180);
        given_step(-10);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(80);
    }
    
    static should_reach_opposite_angle = function() {
        given_angle_from(5);
        given_angle_to(180);
        given_step(-10);
        when_approach_angle_performed();
        then_result_should_be_normal_angle();
        then_result().should_be(0);
    }
    
    // -----
    // Setup
    // -----
    
    current_angle = undefined;
    target_angle = undefined;
    step = 1;
    result = undefined;
    
    static given_angle_from = function(_from) {
        angle_from = _from;
    }
    
    static given_angle_to = function(_to) {
        angle_to = _to;
    }
    
    static given_step = function(_step) {
        step = _step;
    }
    
    static when_approach_angle_performed = function() {
        result = approach_angle(angle_from, angle_to, step);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
    
    static then_result_should_be_normal_angle = function() {
        return result >= 0 && result < 360;
    }
}
