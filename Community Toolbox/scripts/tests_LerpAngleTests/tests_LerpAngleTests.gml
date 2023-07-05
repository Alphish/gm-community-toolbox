function LerpAngleTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "lerp_angle(...)";
    
    static should_handle_zero_difference = function() {
        given_angle_from(123);
        given_angle_to(123);
        given_amount(456);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(123);
    }
    
    static should_correctly_go_counterclockwise_without_crossing_zero = function() {
        given_angle_from(30);
        given_angle_to(150);
        given_amount(0.1);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(42);
    }
    
    static should_correctly_go_clockwise_without_crossing_zero = function() {
        given_angle_from(330);
        given_angle_to(210);
        given_amount(0.1);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(318);
    }
    
    static should_correctly_go_counterclockwise_while_crossing_zero = function() {
        given_angle_from(330);
        given_angle_to(30);
        given_amount(0.8);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(18);
    }
    
    static should_correctly_go_clockwise_while_crossing_zero = function() {
        given_angle_from(30);
        given_angle_to(330);
        given_amount(0.8);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(342);
    }
    
    static should_land_at_zero = function() {
        given_angle_from(30);
        given_angle_to(330);
        given_amount(0.5);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(0);
    }
    
    static should_handle_superpositive_angles = function() {
        given_angle_from(3630); // equivalent to 30
        given_angle_to(7260); // equivalent to 60
        given_amount(0.5);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(45);
    }
    
    static should_handle_supernegative_angles = function() {
        given_angle_from(-3630); // equivalent to -30 or 330
        given_angle_to(-7260); // equivalent to -60 or 300
        given_amount(0.5);
        when_lerp_angle_calculated();
        then_result_should_be_normal_angle();
        then_result().should_be(315);
    }
    
    // -----
    // Setup
    // -----
    
    angle_from = undefined;
    angle_to = undefined;
    amount = undefined;
    result = undefined;
    
    static given_angle_from = function(_from) {
        angle_from = _from;
    }
    
    static given_angle_to = function(_to) {
        angle_to = _to;
    }
    
    static given_amount = function(_amount) {
        amount = _amount;
    }
    
    static when_lerp_angle_calculated = function() {
        result = lerp_angle(angle_from, angle_to, amount);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
    
    static then_result_should_be_normal_angle = function() {
        return result >= 0 && result < 360;
    }
}
