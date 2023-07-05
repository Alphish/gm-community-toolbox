// Inherit the parent event
event_inherited();

current_dir = 90;
target_dir = 90;

cx = x + sprite_width div 2;
cy = y + sprite_height div 2;

on_click = function(_x, _y) {
    target_dir = point_direction(sprite_width div 2, sprite_height div 2, _x, _y);
}
