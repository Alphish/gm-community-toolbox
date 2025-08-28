function VectorLengthDirTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "Vector length/dir functions";
    
    static should_correctly_calculate_zero_vector = function() {
        given_x_component(0);
        given_y_component(0);
        
        when_vector_length_direction_calculated();
        then_length_should_be(0);
        then_angle_should_be(0);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_right_vector = function() {
        given_x_component(12);
        given_y_component(0);
        
        when_vector_length_direction_calculated();
        then_length_should_be(12);
        then_angle_should_be(0);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_up_vector = function() {
        given_x_component(0);
        given_y_component(-34);
        
        when_vector_length_direction_calculated();
        then_length_should_be(34);
        then_angle_should_be(90);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_left_vector = function() {
        given_x_component(-56);
        given_y_component(0);
        
        when_vector_length_direction_calculated();
        then_length_should_be(56);
        then_angle_should_be(180);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_down_vector = function() {
        given_x_component(0);
        given_y_component(78);
        
        when_vector_length_direction_calculated();
        then_length_should_be(78);
        then_angle_should_be(270);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_right_up_vector = function() {
        given_x_component(16);
        given_y_component(12);
        
        when_vector_length_direction_calculated();
        then_length_should_be(20);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_up_left_vector = function() {
        given_x_component(-77);
        given_y_component(-77);
        
        when_vector_length_direction_calculated();
        then_angle_should_be(135);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_left_down_vector = function() {
        given_x_component(-42);
        given_y_component(42);
        
        when_vector_length_direction_calculated();
        then_angle_should_be(225);
        then_lengthdir_should_match();
    }
    
    static should_correctly_calculate_down_right_vector = function() {
        given_x_component(20);
        given_y_component(48);
        
        when_vector_length_direction_calculated();
        then_length_should_be(52);
        then_lengthdir_should_match();
    }
    
    // -----
    // Setup
    // -----
    
    x = undefined;
    y = undefined;
    length = undefined;
    angle = undefined;
    
    static given_x_component = function(_x) {
        x = _x;
    }
    
    static given_y_component = function(_y) {
        y = _y;
    }
    
    static when_vector_length_direction_calculated = function() {
        length = vector_length(x, y);
        angle = vector_direction(x, y);
    }
    
    static then_length_should_be = function(_length) {
        assert_equal(_length, length);
    }
    
    static then_angle_should_be = function(_angle) {
        assert_equal(_angle, angle);
    }
    
    static then_lengthdir_should_match = function() {
        assert_equal(lengthdir_x(length, angle), x);
        assert_equal(lengthdir_y(length, angle), y);
    }
}
