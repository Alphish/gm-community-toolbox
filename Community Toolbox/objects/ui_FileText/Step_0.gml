is_hovered = position_meeting(mouse_x, mouse_y, id);

if (is_hovered && mouse_check_button_pressed(mb_left)) {
    text_popup_id = get_string_async("Enter the text for the text area:", text);
}
