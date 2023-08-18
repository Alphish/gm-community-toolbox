draw_sprite_stretched(sprite_index, is_hovered ? 1 : 0, x, y, sprite_width, sprite_height);

var _x = x + horizontal_margin;
var _y = y + vertical_margin;
var _width = sprite_width - 2 * horizontal_margin;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_DemoInfo);

// not really going to add text-spill protection in a simple demo app
// if the text goes over the text area, well, such is life
draw_text_ext(_x, _y, text, -1, _width);
