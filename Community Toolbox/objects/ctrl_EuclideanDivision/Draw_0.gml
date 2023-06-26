// drawing the cell hovered by the mouse

var _cell_mouse_x = eucdiv(mouse_x - x, cell_size);
var _cell_mouse_y = eucdiv(mouse_y - y, cell_size);

var _cell_mouse_left = x + _cell_mouse_x * cell_size;
var _cell_mouse_top = y + _cell_mouse_y * cell_size;
var _cell_mouse_right = _cell_mouse_left + cell_size - 1;
var _cell_mouse_bottom = _cell_mouse_top + cell_size - 1;

draw_set_color(c_gray);
draw_set_alpha(1);
draw_rectangle(_cell_mouse_left, _cell_mouse_top, _cell_mouse_right, _cell_mouse_bottom, false);

// drawing the grid

var _cell_xfrom = eucdiv(-x, cell_size);
var _cell_yfrom = eucdiv(-y, cell_size);
var _cell_xto = eucdiv(room_width - x, cell_size);
var _cell_yto = eucdiv(room_height - y, cell_size);

draw_set_color(c_silver);
for (var i = _cell_xfrom; i <= _cell_xto; i++)
for (var j = _cell_yfrom; j <= _cell_yto; j++) {
    var _left = x + i * cell_size;
    var _top = y + j * cell_size;
    var _right = _left + cell_size - 1;
    var _bottom = _top + cell_size - 1;
    draw_set_alpha(i >= 0 && j >= 0 ? 1 : 0.5);
    draw_rectangle(_left, _top, _right, _bottom, true);
}

draw_set_color(c_white);
draw_set_alpha(1);
