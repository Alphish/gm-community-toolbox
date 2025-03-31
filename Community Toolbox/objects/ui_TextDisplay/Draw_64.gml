draw_self();

var _x = x + horizontal_margin;
var _y = y + vertical_margin;
var _width = sprite_width - 2 * horizontal_margin;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_DemoInfo);

// not really going to add text-spill protection in a simple demo app
// if the text goes over the text area, well, such is life
var _display_text = string(format, text);
if (word_wrap)
    draw_text_ext(_x, _y, _display_text, -1, _width);
else
    draw_text(_x, _y, _display_text);
