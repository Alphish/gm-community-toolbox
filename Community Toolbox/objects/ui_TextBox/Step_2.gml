if (ctrl_UiManager.keyboard_focus == id)
    image_blend = focus_blend;
else if (position_meeting(mouse_x, mouse_y, id))
    image_blend = hover_blend;
else
    image_blend = basic_blend;

if (is_defined(text_source) && ctrl_UiManager.keyboard_focus != id)
    text = input_format.format(text_source[$ text_property]);
