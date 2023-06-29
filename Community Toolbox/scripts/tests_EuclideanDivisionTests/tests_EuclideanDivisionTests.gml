function EuclideanDivisionTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "Euclidean division";
    
    static should_work_for_zero = function() {
        given_dividend(0);
        given_divisor(3);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(0);
        then_remainder().should_be(0);
    }
    
    static should_work_for_positive_dividend_and_positive_divisor = function() {
        given_dividend(7);
        given_divisor(3);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(2);
        then_remainder().should_be(1);
    }
    
    static should_work_for_negative_dividend_and_positive_divisor = function() {
        given_dividend(-7);
        given_divisor(3);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(-3);
        then_remainder().should_be(2);
    }
    
    static should_work_for_positive_dividend_and_negative_divisor = function() {
        given_dividend(7);
        given_divisor(-3);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(-2);
        then_remainder().should_be(1);
    }
    
    static should_work_for_negative_dividend_and_negative_divisor = function() {
        given_dividend(-7);
        given_divisor(-3);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(3);
        then_remainder().should_be(2);
    }
    
    static should_work_for_positive_boundary_and_positive_divisor = function() {
        given_dividend(60);
        given_divisor(12);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(5);
        then_remainder().should_be(0);
    }
    
    static should_work_for_positive_boundary_and_negative_divisor = function() {
        given_dividend(60);
        given_divisor(-12);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(-5);
        then_remainder().should_be(0);
    }
    
    static should_work_for_negative_boundary_and_positive_divisor = function() {
        given_dividend(-60);
        given_divisor(12);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(-5);
        then_remainder().should_be(0);
    }
    
    static should_work_for_negative_boundary_and_negative_divisor = function() {
        given_dividend(-60);
        given_divisor(-12);
        
        when_euclidean_division_performed();
        
        then_result_should_match_definition();
        then_quotient().should_be(5);
        then_remainder().should_be(0);
    }
    
    // -----
    // Setup
    // -----
    
    dividend = undefined;
    divisor = undefined;
    quotient = undefined;
    remainder = undefined;
    
    static given_dividend = function(_dividend) {
        dividend = _dividend;
    }
    
    static given_divisor = function(_divisor) {
        divisor = _divisor;
    }
    
    static when_euclidean_division_performed = function() {
        quotient = eucdiv(dividend, divisor);
        remainder = eucmod(dividend, divisor);
    }
    
    static then_result_should_match_definition = function() {
        assert_that(remainder >= 0 && remainder < abs(divisor), $"The remainder {remainder} isn't between 0 and {abs(divisor)}.");
        assert_that(quotient == floor(quotient), $"The quotient {quotient} is not an integer.");
        assert_that(quotient * divisor + remainder == dividend, $"The quotient {quotient} and remainder {remainder} aren't correct for the division of {dividend} by {divisor}.");
    }
    
    static then_quotient = function() {
        return new VerrificNumericAssertion(test_asserter, quotient);
    }
    
    static then_remainder = function() {
        return new VerrificNumericAssertion(test_asserter, remainder);
    }
}
