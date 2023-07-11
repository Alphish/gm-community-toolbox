var _left = x - thumb_width div 2;
var _top = y - thumb_height div 2;
var _right = _left + track_width + thumb_width;
var _bottom = _top + thumb_height;

if (
    mouse_x >= _left && mouse_x < _right &&
    mouse_y >= _top && mouse_y < _bottom &&
    mouse_check_button_pressed(mb_left)
) {
    is_dragged = true;
}

if (mouse_check_button_released(mb_left))
    is_dragged = false;

if (is_dragged) {
    var _track_x = clamp(mouse_x - x, 0, track_width);
    var _track_part = _track_x / track_width;
    selected_index = round(_track_part * (values_count - 1));
    variable_owner[$ variable_name] = values[selected_index];
}