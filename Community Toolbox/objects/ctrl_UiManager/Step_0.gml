if (!instance_exists(keyboard_focus)) {
    keyboard_focus = noone;
} else {
    if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, keyboard_focus))
        keyboard_focus = noone;
}

with (keyboard_focus) {
    event_user(0);
}
