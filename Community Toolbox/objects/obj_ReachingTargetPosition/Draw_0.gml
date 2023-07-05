event_inherited();

draw_set_color(c_gray);
draw_set_alpha(1);
draw_circle(x + target_x, y + target_y, 4, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_circle(x + current_x, y + current_y, 4, false);

draw_set_alpha(1);
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text(
    x + sprite_width div 2, y - 16,
    "Click area to change target position"
);

draw_set_color(current_x == target_x && current_y == target_y ? c_lime : c_orange);
draw_text(
    x + sprite_width div 2, y + sprite_height + 16,
    $"({string_format(current_x, 0, 3)},{string_format(current_y, 0, 3)}) " +
    $"-> ({string_format(target_x, 0, 3)},{string_format(target_y, 0, 3)})"
);

draw_set_color(c_white);
draw_set_alpha(1);
