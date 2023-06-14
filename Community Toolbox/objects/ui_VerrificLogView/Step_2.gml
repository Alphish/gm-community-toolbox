/// @desc Update scroll offset

var _gui_height = display_get_gui_height();
var _lines_count = array_length(lines);
total_height = max(_gui_height, line_height * _lines_count);
var _max_offset = total_height - _gui_height;

if (mouse_wheel_up())
    scroll_offset -= wheel_speed;

if (mouse_wheel_down())
    scroll_offset += wheel_speed;

if (keyboard_check(vk_up))
    scroll_offset -= arrow_speed;

if (keyboard_check(vk_down))
    scroll_offset += arrow_speed;

if (keyboard_check_pressed(vk_pageup))
    scroll_offset -= page_speed;

if (keyboard_check_pressed(vk_pagedown))
    scroll_offset += page_speed;

scroll_offset = clamp(scroll_offset, 0, _max_offset);
