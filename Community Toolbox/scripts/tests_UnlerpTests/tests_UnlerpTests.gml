function UnlerpTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "unlerp";
    
    static should_unlerp_head = function() {
        given_range_from(35);
        given_range_to(67);
        given_amount(35);
        when_unlerp_calculated();
        then_result().should_be(0);
    }
    
    static should_unlerp_beyond_head = function() {
        given_range_from(35);
        given_range_to(67);
        given_amount(27);
        when_unlerp_calculated();
        then_result().should_be(-0.25);
    }
    
    static should_unlerp_tail = function() {
        given_range_from(35);
        given_range_to(67);
        given_amount(67);
        when_unlerp_calculated();
        then_result().should_be(1);
    };
    
    static should_unlerp_beyond_tail = function() {
        given_range_from(35);
        given_range_to(67);
        given_amount(75);
        when_unlerp_calculated();
        then_result().should_be(1.25);
    }
    
    static should_unlerp_body = function() {
        given_range_from(35);
        given_range_to(67);
        given_amount(43);
        when_unlerp_calculated();
        then_result().should_be(0.25);
    };
    
    static should_unlerp_head_in_reverse = function() {
        given_range_from(67);
        given_range_to(35);
        given_amount(67);
        when_unlerp_calculated();
        then_result().should_be(0);
    }
    
    static should_unlerp_beyond_head_in_reverse = function() {
        given_range_from(67);
        given_range_to(35);
        given_amount(75);
        when_unlerp_calculated();
        then_result().should_be(-0.25);
    }
    
    static should_unlerp_tail_in_reverse = function() {
        given_range_from(67);
        given_range_to(35);
        given_amount(35);
        when_unlerp_calculated();
        then_result().should_be(1);
    };
    
    static should_unlerp_beyond_tail_in_reverse = function() {
        given_range_from(67);
        given_range_to(35);
        given_amount(27);
        when_unlerp_calculated();
        then_result().should_be(1.25);
    }
    
    static should_unlerp_body_in_reverse = function() {
        given_range_from(67);
        given_range_to(35);
        given_amount(43);
        when_unlerp_calculated();
        then_result().should_be(0.75);
    };
    
    // -----
    // Setup
    // -----
    
    range_from = 0;
    range_to = 0;
    amount = 0;
    result = 0;
    
    static given_range_from = function(_from) {
        range_from = _from;
    }
    
    static given_range_to = function(_to) {
        range_to = _to;
    }
    
    static given_amount = function(_amount) {
        amount = _amount;
    }
    
    static when_unlerp_calculated = function() {
        result = unlerp(range_from, range_to, amount);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
