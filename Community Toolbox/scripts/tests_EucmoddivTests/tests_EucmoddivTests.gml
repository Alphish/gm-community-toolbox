function EucmoddivTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "eucmod/eucdiv";
    static should_be_positive_eucmod_pos_pos = function() {
        _a = 7;
        _b = 3;
        _r = eucmod(_a,_b);
        assert_is_true( _r >= 0 && _r < abs(_b));
    }
    
    static should_be_positive_eucmod_pos_neg = function() {
        _a = 7;
        _b = -3;
        _r = eucmod(_a,_b);
        assert_is_true( _r >= 0 && _r < abs(_b));
    }
    
    static should_be_positive_eucmod_neg_pos = function() {
        _a = -7;
        _b = 3;
        _r = eucmod(_a,_b);
        assert_is_true( _r >= 0 && _r < abs(_b));
    }
    
    static should_be_positive_eucmod_neg_neg = function() {
        _a = -7;
        _b = -3;
        _r = eucmod(_a,_b);
        assert_is_true( _r >= 0 && _r < abs(_b));
    }
    
    static should_equal_dividend_pos_pos = function() {
        _a = 7;
        _b = 3;
        _result = eucdiv(_a, _b) * _b + eucmod(_a, _b);
        assert_is_true(_a == _result);
    }
    
    static should_equal_dividend_pos_neg = function() {
        _a = 7;
        _b = -3;
        _result = eucdiv(_a, _b) * _b + eucmod(_a, _b);
        assert_is_true(_a == _result);
    }
    
    static should_equal_dividend_neg_pos = function() {
        _a = -7;
        _b = 3;
        _result = eucdiv(_a, _b) * _b + eucmod(_a, _b);
        assert_is_true(_a == _result);
    }
    
    static should_equal_dividend_neg_neg = function() {
        _a = -7;
        _b = -3;
        _result = eucdiv(_a, _b) * _b + eucmod(_a, _b);
        assert_is_true(_a == _result);
    }
    
}