#region Euclidean division

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

#endregion

#region Reaching target values

/// @func lerp_angle(from,to,amount)
/// @desc Calculates the angle interpolated between a starting and destination angle for the given fraction amount.
/// @arg {Real} from            The starting angle.
/// @arg {Real} to              The destination angle.
/// @arg {Real} amount          The amount to interpolate (0 matches the starting angle, 1 matches the destination angle).
/// @returns {Real}
function lerp_angle(_from, _to, _amount) {
    var _new_angle = _from + angle_difference(_to, _from) * _amount;
    return eucmod(_new_angle, 360);
}

/// @func approach(current,target,[step])
/// @desc Calculates the value a step closer to the target value. If the target is close enough, returns the target.
/// @arg {Real} current         The current value.
/// @arg {Real} target          The target value.
/// @arg {Real} [step]          The step to approach the target by (1 by default).
/// @returns {Real}
function approach(_current, _target, _step = 1) {
    // for a negative step, the value moves away from the target indefinitely
    if (_step < 0)
        return _current + sign(_target - _current) * _step;
    
    // for a positive step, the object approaches the target until reaching it
    var _diff = _target - _current;
    return abs(_diff) < _step
        ? _target
        : _current + sign(_diff) * _step;
}

/// @func approach_angle(current,target,[step])
/// @desc Calculates the angle a step closer to the target angle. If the target is close enough, returns the target.
/// @arg {Real} current         The current angle.
/// @arg {Real} target          The target angle.
/// @arg {Real} [step]          The step to approach the target by (1 by default).
function approach_angle(_current, _target, _step = 1) {
    if (_step == 0)
        return _current;
    
    // for a negative step, the value approaches the opposite angle instead
    // making the step positive so that clamp receives min/max arguments in the correct order
    if (_step < 0) {
        _target = 180 + _target;
        _step = -_step;
    }
    
    var _diff = angle_difference(_target, _current);
    var _new_angle = abs(_diff) < _step
        ? _target
        : _current + sign(_diff) * _step;
    return eucmod(_new_angle, 360);
}

#endregion