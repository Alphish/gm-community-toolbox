event_inherited();

draw_set_color(#404040);
draw_set_alpha(1);

draw_circle(cx, cy, round(sprite_width * 0.3), false);
draw_circle(
    cx + lengthdir_x(sprite_width * 0.4, target_dir),
    cy + lengthdir_y(sprite_width * 0.4, target_dir),
    8, false
);

draw_set_color(c_white);
draw_set_alpha(1);

draw_line_width(
    cx, cy,
    cx + lengthdir_x(sprite_width * 0.3, current_dir),
    cy + lengthdir_y(sprite_width * 0.3, current_dir),
    3
    );
draw_circle(
    cx + lengthdir_x(sprite_width * 0.3, current_dir),
    cy + lengthdir_y(sprite_width * 0.3, current_dir),
    8, false
);

draw_set_alpha(1);
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text(
    x + sprite_width div 2, y - 16,
    "Click area to change target angle"
);

draw_set_color(current_dir == target_dir ? c_lime : c_orange);
draw_text(
    x + sprite_width div 2, y + sprite_height + 16,
    $"{string_format(current_dir, 0, 3)}deg " +
    $"-> {string_format(target_dir, 0, 3)}deg"
);

draw_set_color(c_white);
draw_set_alpha(1);
