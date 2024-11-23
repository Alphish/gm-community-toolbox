if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    is_grabbed = true;
    grab_x = mouse_x - x;
    grab_y = mouse_y - y;
}

if (mouse_check_button_released(mb_left)) {
    is_grabbed = false;
    grab_x = 0;
    grab_y = 0;
}

if (is_grabbed) {
    x = mouse_x - grab_x;
    y = mouse_y - grab_y;
}
