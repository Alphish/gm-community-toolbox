draw_set_color_alpha(panel_color, panel_alpha);
draw_rectangle(x, y, x + width - 1, y + height - 1, false);

draw_set_color_alpha(text_color, 1);
draw_set_font(fnt_DemoInfo);
draw_set_align(text_halign, text_valign);
draw_text(x + width div 2, y + height div 2, "This is some\nexample text\nto demonstrate text alignment");

draw_set_color_alpha(c_white, 1);
