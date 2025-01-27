draw_set_color_alpha(c_white, 1);

draw_self();

draw_set_align(fa_left, fa_middle);

if (!is_string(description) || description == "") {
    draw_set_font(fnt_DemoTitle);
    draw_text(x + 32, y + sprite_height div 2, title);
} else {
    draw_set_font(fnt_DemoTitle);
    draw_text(x + 32, y + 24, title);
    draw_set_font(fnt_DemoInfo);
    draw_text_ext(x + 32, y + 40 + ((sprite_height - 48) div 2), description, -1, sprite_width - 64);
}
