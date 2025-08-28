draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(x, y, x + width - 1, y + height - 1, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(x, y, x + width - 1, y + height - 1, true);

var _grid_mouse_x = mouse_x - ctrl_EuclideanDivision.x;
var _grid_mouse_y = mouse_y - ctrl_EuclideanDivision.y;

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_DemoInfo);
draw_text(
    x + 8,
    y + height div 2,
    $"Euclidean division\nfor grid coordinates:\n" +
    $"\n" +
    $"Hover cell: ({eucdiv(_grid_mouse_x, cell_size)}, {eucdiv(_grid_mouse_y, cell_size)})\n" +
    $"\n" +
    $"{_grid_mouse_x} div {cell_size} = {_grid_mouse_x div cell_size}\n" +
    $"{_grid_mouse_x} mod {cell_size} = {_grid_mouse_x mod cell_size}\n" +
    $"eucdiv({_grid_mouse_x}, {cell_size}) = {eucdiv(_grid_mouse_x, cell_size)}\n" +
    $"eucmod({_grid_mouse_x}, {cell_size}) = {eucmod(_grid_mouse_x, cell_size)}"
    );
