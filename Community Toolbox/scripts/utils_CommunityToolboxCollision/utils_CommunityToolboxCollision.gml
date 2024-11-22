/// @func instance_position_top(x,y,obj)
/// @desc Finds the instance colliding with the given point at the least depth. If none is found, noone is returned.
/// @arg {Real} x                                       The x coordinate of the point to check.
/// @arg {Real} y                                       The y coordinate of the point to check.
/// @arg {Asset.GMObject, Constant.All, Array} obj      The object(s) to find at the given point.
/// @returns {Id.Instance}
function instance_position_top(_x, _y, _obj) {
    var _list = ds_list_create();
    var _count = instance_position_list(_x, _y, _obj, _list, false);
    if (_count == 0) {
        ds_list_destroy(_list);
        return noone;
    }
    
    var _result = _list[| 0];
    for (var i = 1; i < _count; i++) {
        var _instance = _list[| i];
        if (_instance.depth < _result.depth)
            _result = _instance;
    }
    
    ds_list_destroy(_list);
    return _result;
}
