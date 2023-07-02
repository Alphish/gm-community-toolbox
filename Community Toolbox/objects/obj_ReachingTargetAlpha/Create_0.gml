// Inherit the parent event
event_inherited();

current_alpha = 100;
target_alpha = 100;

on_click = function(_x, _y) {
    target_alpha = target_alpha == 0 ? 100 : 0;
}
