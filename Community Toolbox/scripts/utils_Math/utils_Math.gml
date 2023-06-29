/// @func eucmod(dividend,divisor)
/// @desc Calculates a remainder from the Euclidian division (the remainder will always be non-negative).
/// @arg {Real} dividend        The dividend (i.e. the value to get the remainder of).
/// @arg {Real} divisor         The divisor (i.e. the value to divide by).
/// @returns {Real}
function eucmod(_dividend, _divisor) {
    var _remainder = _dividend mod _divisor;
    
    if (_remainder >= 0)
        return _remainder;
    else if (_divisor > 0)
        return _remainder + _divisor;
    else
        return _remainder - _divisor;
}

/// @func eucdiv(dividend,divisor)
/// @desc Calculates an integer quotient of the Euclidian division (i.e. the division with always non-negative remainder).
/// @arg {Real} dividend        The dividend (i.e. the value to be divided).
/// @arg {Real} divisor         The divisor (i.e. the value to divide by).
/// @returns {Real}
function eucdiv(_dividend, _divisor) {
    // remove the remainder part, then divide the rest
    _dividend -= eucmod(_dividend, _divisor);
    return _dividend div _divisor;
}
