draw_set_alpha(1);
draw_set_color(c_white);
draw_self();

draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// drawing the input text, with extra character
// you may replace it with some background rectangle or such
draw_text(x + horizontal_margin, y + vertical_margin, text);

// showing the input underscore
if (ctrl_UiManager.keyboard_focus == id && blink < blink_max div 2) {
    var _precursor_text = string_copy(text, 1, insert_position);
    var _cursor_x = string_width(_precursor_text);
    draw_text(x + horizontal_margin + _cursor_x, y + vertical_margin, "_");
}
