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

#region Fixed step approach

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
/// @desc Calculates the angle (in degrees) a step closer to the target angle. If the target is close enough, returns the target.
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

#region Linear interpolation

/// @func lerp_angle(from,to,amount)
/// @desc Calculates the angle (in degrees) interpolated between a starting and destination angle for the given fraction amount.
/// @arg {Real} from            The starting angle.
/// @arg {Real} to              The destination angle.
/// @arg {Real} amount          The amount to interpolate (0 matches the starting angle, 1 matches the destination angle).
/// @returns {Real}
function lerp_angle(_from, _to, _amount) {
    var _new_angle = _from + angle_difference(_to, _from) * _amount;
    return eucmod(_new_angle, 360);
}

/// @func unlerp(from,to,value)
/// @desc Returns the interpolation amount such that lerp(from, to, amount) equals the given value.
/// @arg {Real} from        The first value.
/// @arg {Real} to          The second value.
/// @arg {Real} value       The interpolated value.
/// @returns {Real}
function unlerp(_from, _to, _value) {
    if (_from == _to) {
        throw "unlerp() range has zero width.";
    }
    return (_value - _from) / (_to - _from);
}

/// @func relerp(oldfrom,oldto,oldvalue,newfrom,newto)
/// @desc Given an interpolated value in the old range (oldfrom, oldto), returns its equivalent value in the new range (newfrom, newto).
/// @arg {Real} oldfrom     The old range's first value.
/// @arg {Real} oldto       The old range's second value.
/// @arg {Real} oldvalue    The value to re-interpolate.
/// @arg {Real} newfrom     The new range's first value.
/// @arg {Real} newto       The new range's second value.
/// @returns {Real}
function relerp(_oldfrom, _oldto, _oldvalue, _newfrom, _newto) {
    if (_oldto == _oldfrom) {
        throw "relerp() old range has zero width.";
    }
    var _amount = (_oldvalue - _oldfrom) / (_oldto - _oldfrom);
    return _newfrom + (_newto - _newfrom) * _amount;
}

#endregion

#region Geometry

/// @func vector_length(x,y)
/// @desc Calculates the length of a vector with given X/Y components.
/// @arg {Real} x           The X (horizontal) component of the vector.
/// @arg {Real} y           The Y (vertical) component of the vector.
/// @returns {Real}
function vector_length(_x, _y) {
    gml_pragma("forceinline");
    return point_distance(0, 0, _x, _y);
}

/// @func vector_direction(x,y)
/// @desc Calculates the direction a vector with given X/Y components points towards.
/// @arg {Real} x           The X (horizontal) component of the vector.
/// @arg {Real} y           The Y (vertical) component of the vector.
/// @returns {Real}
function vector_direction(_x, _y) {
    gml_pragma("forceinline");
    return point_direction(0, 0, _x, _y);
}

#endregion
