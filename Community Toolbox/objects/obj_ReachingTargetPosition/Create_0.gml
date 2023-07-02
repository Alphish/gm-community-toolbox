// Inherit the parent event
event_inherited();

current_x = sprite_width div 2;
current_y = sprite_height div 2;
target_x = current_x;
target_y = current_y;

on_click = function(_x, _y) {
    target_x = _x;
    target_y = _y;
}
