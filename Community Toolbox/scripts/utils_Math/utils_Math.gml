/// @func eucmod(dvnd,dvsr)
/// @desc Calculates a remainder from the Euclidian division (the remainder will always be non-negative).
/// @arg {Real} dvnd        The value to divide, or dividend.
/// @arg {Real} dvsr        The value to divide by, or divisor.
/// @returns {Real}
function eucmod(_dvnd,_dvsr){
    _r = _dvnd%_dvsr;
    if (_r > 0)
        return _r;
    else if (_dvsr > 0)
        return _r + _dvsr;
    else
        return _r - _dvsr;
}

/// @func eucdiv(dvnd,dvsr)
/// @desc Calculates an integer quotient of the Euclidian division (i.e. with non-negative remainder).
/// @arg {Real} dvnd        The value to divide, or dividend.
/// @arg {Real} dvsr        The value to divide by, or divisor.
/// @returns {Real}
function eucdiv(_dvnd,_dvsr){
    _q = _dvnd div _dvsr;
    
    if (_dvnd > 0)
        return _q;
    else if (_dvsr > 0)
        return _q - 1;
    else
        return _q + 1;
}
