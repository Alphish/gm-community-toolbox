is_hovered = position_meeting(mouse_x, mouse_y, id);
image_index = is_hovered ? 1 : 0;

if (is_hovered && mouse_check_button_pressed(mb_left))
    on_click();
