if (position_meeting(mouse_x, mouse_y, id)) {
    if (mouse_wheel_down())
        scroll_down();
    else if (mouse_wheel_up())
        scroll_up();
}
