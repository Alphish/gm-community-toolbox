draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_stretched(sprite_index, is_hovered || is_active ? 1 : 0, x, y, sprite_width, sprite_height);

draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + sprite_width div 2, y + sprite_height div 2, text);
