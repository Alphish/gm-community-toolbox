draw_set_font(fnt_TextInput);
draw_set_align(fa_left, fa_middle);

draw_set_color(character.head_color);
draw_text(64, room_height div 2 - 60, $"{color_to_text(character.head_color)} {character.head_type}");

draw_set_color(character.torso_color);
draw_text(64, room_height div 2, $"{color_to_text(character.torso_color)} {character.torso_type}");

draw_set_color(character.legs_color);
draw_text(64, room_height div 2 + 60, $"{color_to_text(character.legs_color)} {character.legs_type}");

draw_set_color(c_white);
