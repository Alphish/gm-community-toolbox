draw_set_color_alpha(c_white, 1);

draw_self();

draw_set_font(fnt_DemoInfo);
draw_set_align(fa_center, fa_middle);
draw_text(x + sprite_width div 2, y + sprite_height div 2, text);
