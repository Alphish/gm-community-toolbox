// Inherit the parent event
event_inherited();

current_number = irandom(1000000000);
target_number = current_number;

on_click = function(_x, _y) {
    target_number = irandom(1000000000);
}
