track_width = 320;
track_height = 2;
tick_width = 2;
tick_height = 32;
thumb_width = 8;
thumb_height = 40;

values_count = array_length(values);
selected_index = array_get_index(values, variable_owner[$ variable_name]);

is_dragged = false;

// drawing functions

draw_track = function() {
    draw_set_color(c_gray);
    draw_set_alpha(1);
    
    var _left = x;
    var _top = y - track_height div 2;
    var _right = x + track_width;
    var _bottom = y + track_height;
    
    draw_rectangle(_left, _top, _right - 1, _bottom - 1, false);
}

draw_tick_at = function(_x) {
    draw_set_color(c_gray);
    draw_set_alpha(1);
    
    var _left = x + _x - tick_width div 2;
    var _top = y - tick_height div 2;
    var _right = _left + tick_width;
    var _bottom = _top + tick_height;
    
    draw_rectangle(_left, _top, _right - 1, _bottom - 1, false);
}

draw_thumb_at = function(_x) {
    draw_set_color(c_white);
    draw_set_alpha(1);
    
    var _left = x + _x - thumb_width div 2;
    var _top = y - thumb_height div 2;
    var _right = _left + thumb_width;
    var _bottom = _top + thumb_height;
    
    draw_rectangle(_left, _top, _right - 1, _bottom - 1, false);
}

get_index_x = function(_idx) {
    return round(_idx * track_width / (values_count - 1));
}
