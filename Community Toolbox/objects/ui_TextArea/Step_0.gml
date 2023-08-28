is_hovered = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (is_hovered && device_mouse_check_button_pressed(0, mb_left) && text_popup_id == -1) {
    text_popup_id = get_string_async("Enter the text for the text area:", text);
}
