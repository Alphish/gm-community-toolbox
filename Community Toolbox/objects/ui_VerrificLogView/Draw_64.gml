var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// draw the main background
// it's not necessary to draw when the screen is filled with lines
// but I don't feel like writing what would be a minor optimisation, anyway
draw_set_alpha(1);
draw_set_color(none_background);
draw_rectangle(0, 0, _gui_width, _gui_height, false);

// draw the lines
var _start_line = scroll_offset div line_height;
var _end_line = ((scroll_offset + _gui_height) div line_height) + 1;
var _lines_count = array_length(lines);
_end_line = min(_end_line, _lines_count);

for (var i = _start_line; i < _end_line; i++) {
    var _line = lines[i];
    var _line_y = line_height * i - scroll_offset;
    
    // draw the line background
    draw_set_color(i % 2 == 0 ? even_background : odd_background);
    draw_rectangle(0, _line_y, _gui_width, _line_y + line_height - 1, false);
    
    // draw the line text
    var _status = _line.status;
    draw_set_color(is_undefined(_status) ? info_color : status_colors[_status]);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_font(text_font);
    
    var _text_x = left_margin + indent_width * _line.level;
    var _text_y = _line_y + line_height div 2;
    draw_text(_text_x, _text_y, _line.text);
}

// reset the colour
draw_set_alpha(1);
draw_set_color(c_white);
