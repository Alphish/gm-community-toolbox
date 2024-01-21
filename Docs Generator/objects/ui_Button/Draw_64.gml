draw_sprite_stretched_ext(sprite_index, is_hovered ? 1 : 0, x, y, sprite_width, sprite_height, image_blend, 1);

draw_set_alpha(1);
draw_set_color(image_blend);

draw_set_font(fnt_BasicText);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + sprite_width div 2, y + sprite_height div 2, text);

draw_set_alpha(1);
draw_set_color(c_white);
