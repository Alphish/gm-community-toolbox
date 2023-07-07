function RelerpTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "relerp";
    
    static should_relerp_head = function() {
        given_old_range_from(35);
        given_old_range_to(67);
        given_amount(35);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1000);
    }
    
    static should_relerp_beyond_head = function() {
        given_old_range_from(35);
        given_old_range_to(67);
        given_amount(27);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(975);
    }
    
    static should_relerp_tail = function() {
        given_old_range_from(35);
        given_old_range_to(67);
        given_amount(67);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1100);
    };
    
    static should_relerp_beyond_tail = function() {
        given_old_range_from(35);
        given_old_range_to(67);
        given_amount(75);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1125);
    }
    
    static should_relerp_body = function() {
        given_old_range_from(35);
        given_old_range_to(67);
        given_amount(43);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1025);
    };
    
    static should_relerp_head_in_reverse = function() {
        given_old_range_from(67);
        given_old_range_to(35);
        given_amount(67);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1000);
    }
    
    static should_relerp_beyond_head_in_reverse = function() {
        given_old_range_from(67);
        given_old_range_to(35);
        given_amount(75);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(975);
    }
    
    static should_relerp_tail_in_reverse = function() {
        given_old_range_from(67);
        given_old_range_to(35);
        given_amount(35);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1100);
    };
    
    static should_relerp_beyond_tail_in_reverse = function() {
        given_old_range_from(67);
        given_old_range_to(35);
        given_amount(27);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1125);
    }
    
    static should_relerp_body_in_reverse = function() {
        given_old_range_from(67);
        given_old_range_to(35);
        given_amount(43);
        given_new_range_from(1000);
        given_new_range_to(1100);
        when_relerp_calculated();
        then_result().should_be(1075);
    };
    
    // -----
    // Setup
    // -----
    
    old_range_from = 0;
    old_range_to = 0;
    amount = 0;
    new_range_from = 0;
    new_range_to = 0;
    result = 0;
    
    static given_old_range_from = function(_from) {
        old_range_from = _from;
    }
    
    static given_old_range_to = function(_to) {
        old_range_to = _to;
    }
    
    static given_amount = function(_amount) {
        amount = _amount;
    }
    
    static given_new_range_from = function(_from) {
        new_range_from = _from;
    }
    
    static given_new_range_to = function(_to) {
        new_range_to = _to;
    }
    
    static when_relerp_calculated = function() {
        result = relerp(old_range_from, old_range_to, amount, new_range_from, new_range_to);
    }
    
    static then_result = function() {
        return new VerrificNumericAssertion(test_asserter, result);
    }
}
