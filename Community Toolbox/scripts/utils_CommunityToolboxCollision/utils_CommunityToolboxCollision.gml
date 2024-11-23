/// @func instance_position_top(x,y,obj)
/// @desc Finds the instance at the given position with the least depth. If no instance is at the position, noone is returned.
/// @arg {Real} x                                       The x coordinate of the point to check.
/// @arg {Real} y                                       The y coordinate of the point to check.
/// @arg {Asset.GMObject,Constant.All,Array} obj        The object(s) to find at the given position.
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

/// @func instance_position_array(x,y,obj,array,[ordered],[replace])
/// @desc Finds all instances of the given type at the given position, then populates the given array. Returns the number of colliding instances found.
/// @arg {Real} x                                                       The x coordinate of the checked position.
/// @arg {Real} y                                                       The y coordinate of the checked position.
/// @arg {Asst.GMObject,Constant.All,Array,Id.TileMapElement} obj       The object(s) to find at the given position.
/// @arg {Array} array                                                  The array to populate with the colliding objects.
/// @arg {Bool} [ordered]                                               Whether the instances should be sorted by the distance or not.
/// @arg {Bool} [replace]                                               Whether to replace the contents of the array or only append them.
/// @returns {Real}
function instance_position_array(_x, _y, _obj, _array, _ordered = false, _replace = false) {
    var _list = ds_list_create();
    var _count = instance_position_list(_x, _y, _obj, _list, _ordered);
    var _offset = _replace ? 0 : array_length(_array);
    array_resize(_array, _offset + _count);
    for (var i = 0; i < _count; i++) {
        _array[_offset + i] = _list[| i];
    }
    ds_list_destroy(_list);
    return _count;
}

/// @func instance_place_array(x,y,obj,array,[ordered],[replace])
/// @desc Finds all instances of the given type colliding with the caller's collision mask at the given position, then populates the given array. Returns the number of colliding instances found.
/// @arg {Real} x                                                       The x coordinate of the checked placement
/// @arg {Real} y                                                       The y coordinate of the checked placement.
/// @arg {Asst.GMObject,Constant.All,Array,Id.TileMapElement} obj       The object(s) to check the collision of.
/// @arg {Array} array                                                  The array to populate with the colliding objects.
/// @arg {Bool} [ordered]                                               Whether the instances should be sorted by the distance or not.
/// @arg {Bool} [replace]                                               Whether to replace the contents of the array or only append them.
/// @returns {Real}
function instance_place_array(_x, _y, _obj, _array, _ordered = false, _replace = false) {
    var _list = ds_list_create();
    var _count = instance_place_list(_x, _y, _obj, _list, _ordered);
    var _offset = _replace ? 0 : array_length(_array);
    array_resize(_array, _offset + _count);
    for (var i = 0; i < _count; i++) {
        _array[_offset + i] = _list[| i];
    }
    ds_list_destroy(_list);
    return _count;
}

/// @func collision_point_array(x,y,obj,prec,notme,array,[ordered],[replace])
/// @desc Finds all instances of the given type colliding with the given point, then populates the given array. Returns the number of colliding instances found.
/// @arg {Real} x                                                       The x coordinate of the collision point.
/// @arg {Real} y                                                       The y coordinate of the collision point.
/// @arg {Asst.GMObject,Constant.All,Array,Id.TileMapElement} obj       The object(s) to check the collision of.
/// @arg {Bool} prec                                                    Whether the check is based on instances' masks (true) or bounding boxes (false).
/// @arg {Bool} notme                                                   Whether the calling instance may be returned as one of the colliding instances or not.
/// @arg {Array} array                                                  The array to populate with the colliding objects.
/// @arg {Bool} [ordered]                                               Whether the instances should be sorted by the distance or not.
/// @arg {Bool} [replace]                                               Whether to replace the contents of the array or only append them.
/// @returns {Real}
function collision_point_array(_x, _y, _obj, _prec, _notme, _array, _ordered = false, _replace = false) {
    var _list = ds_list_create();
    var _count = collision_point_list(_x, _y, _obj, _prec, _notme, _list, _ordered);
    var _offset = _replace ? 0 : array_length(_array);
    array_resize(_array, _offset + _count);
    for (var i = 0; i < _count; i++) {
        _array[_offset + i] = _list[| i];
    }
    ds_list_destroy(_list);
    return _count;
}

/// @func collision_circle_array(x,y,radius,obj,prec,notme,array,[ordered],[replace])
/// @desc Finds all instances of the given type colliding with the given circle, then populates the given array. Returns the number of colliding instances found.
/// @arg {Real} x                                                       The x coordinate of the circle center.
/// @arg {Real} y                                                       The y coordinate of the circle center.
/// @arg {Real} radius                                                  The radius of the collision circle.
/// @arg {Asst.GMObject,Constant.All,Array,Id.TileMapElement} obj       The object(s) to check the collision of.
/// @arg {Bool} prec                                                    Whether the check is based on instances' masks (true) or bounding boxes (false).
/// @arg {Bool} notme                                                   Whether the calling instance may be returned as one of the colliding instances or not.
/// @arg {Array} array                                                  The array to populate with the colliding objects.
/// @arg {Bool} [ordered]                                               Whether the instances should be sorted by the distance or not.
/// @arg {Bool} [replace]                                               Whether to replace the contents of the array or only append them.
/// @returns {Real}
function collision_circle_array(_x, _y, _radius, _obj, _prec, _notme, _array, _ordered = false, _replace = false) {
    var _list = ds_list_create();
    var _count = collision_circle_list(_x, _y, _radius, _obj, _prec, _notme, _list, _ordered);
    var _offset = _replace ? 0 : array_length(_array);
    array_resize(_array, _offset + _count);
    for (var i = 0; i < _count; i++) {
        _array[_offset + i] = _list[| i];
    }
    ds_list_destroy(_list);
    return _count;
}

/// @func collision_line_array(x1,y1,x2,y2,obj,prec,notme,array,[ordered],[replace])
/// @desc Finds all instances of the given type colliding with the given line, then populates the given array. Returns the number of colliding instances found.
/// @arg {Real} x1                                                      The x coordinate of the line starting point.
/// @arg {Real} y1                                                      The y coordinate of the line starting point.
/// @arg {Real} x2                                                      The x coordinate of the line ending point.
/// @arg {Real} y2                                                      The y coordinate of the line ending point.
/// @arg {Asst.GMObject,Constant.All,Array,Id.TileMapElement} obj       The object(s) to check the collision of.
/// @arg {Bool} prec                                                    Whether the check is based on instances' masks (true) or bounding boxes (false).
/// @arg {Bool} notme                                                   Whether the calling instance may be returned as one of the colliding instances or not.
/// @arg {Array} array                                                  The array to populate with the colliding objects.
/// @arg {Bool} [ordered]                                               Whether the instances should be sorted by the distance or not.
/// @arg {Bool} [replace]                                               Whether to replace the contents of the array or only append them.
/// @returns {Real}
function collision_line_array(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _array, _ordered = false, _replace = false) {
    var _list = ds_list_create();
    var _count = collision_line_list(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _list, _ordered);
    var _offset = _replace ? 0 : array_length(_array);
    array_resize(_array, _offset + _count);
    for (var i = 0; i < _count; i++) {
        _array[_offset + i] = _list[| i];
    }
    ds_list_destroy(_list);
    return _count;
}

/// @func collision_rectangle_array(x1,y1,x2,y2,obj,prec,notme,array,[ordered],[replace])
/// @desc Finds all instances of the given type colliding with the given rectangle, then populates the given array. Returns the number of colliding instances found.
/// @arg {Real} x1                                                      The x coordinate of the rectangle's left side.
/// @arg {Real} y1                                                      The y coordinate of the rectangle's top side.
/// @arg {Real} x2                                                      The x coordinate of the rectangle's right side.
/// @arg {Real} y2                                                      The y coordinate of the rectangle's bottom side.
/// @arg {Asst.GMObject,Constant.All,Array,Id.TileMapElement} obj       The object(s) to check the collision of.
/// @arg {Bool} prec                                                    Whether the check is based on instances' masks (true) or bounding boxes (false).
/// @arg {Bool} notme                                                   Whether the calling instance may be returned as one of the colliding instances or not.
/// @arg {Array} array                                                  The array to populate with the colliding objects.
/// @arg {Bool} [ordered]                                               Whether the instances should be sorted by the distance or not.
/// @arg {Bool} [replace]                                               Whether to replace the contents of the array or only append them.
/// @returns {Real}
function collision_rectangle_array(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _array, _ordered = false, _replace = false) {
    var _list = ds_list_create();
    var _count = collision_rectangle_list(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _list, _ordered);
    var _offset = _replace ? 0 : array_length(_array);
    array_resize(_array, _offset + _count);
    for (var i = 0; i < _count; i++) {
        _array[_offset + i] = _list[| i];
    }
    ds_list_destroy(_list);
    return _count;
}

/// @func collision_ellipse_array(x1,y1,x2,y2,obj,prec,notme,array,[ordered],[replace])
/// @desc Finds all instances of the given type colliding with the given ellipse, then populates the given array. Returns the number of colliding instances found.
/// @arg {Real} x1                                                      The x coordinate of the ellipse's left side.
/// @arg {Real} y1                                                      The y coordinate of the ellipse's top side.
/// @arg {Real} x2                                                      The x coordinate of the ellipse's right side.
/// @arg {Real} y2                                                      The y coordinate of the ellipse's bottom side.
/// @arg {Asst.GMObject,Constant.All,Array,Id.TileMapElement} obj       The object(s) to check the collision of.
/// @arg {Bool} prec                                                    Whether the check is based on instances' masks (true) or bounding boxes (false).
/// @arg {Bool} notme                                                   Whether the calling instance may be returned as one of the colliding instances or not.
/// @arg {Array} array                                                  The array to populate with the colliding objects.
/// @arg {Bool} [ordered]                                               Whether the instances should be sorted by the distance or not.
/// @arg {Bool} [replace]                                               Whether to replace the contents of the array or only append them.
/// @returns {Real}
function collision_ellipse_array(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _array, _ordered = false, _replace = false) {
    var _list = ds_list_create();
    var _count = collision_ellipse_list(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _list, _ordered);
    var _offset = _replace ? 0 : array_length(_array);
    array_resize(_array, _offset + _count);
    for (var i = 0; i < _count; i++) {
        _array[_offset + i] = _list[| i];
    }
    ds_list_destroy(_list);
    return _count;
}
