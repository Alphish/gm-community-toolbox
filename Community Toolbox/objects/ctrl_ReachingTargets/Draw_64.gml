draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(320, 16, title);
draw_text_ext(320, 48, description, -1, room_width - 352);
