event_inherited();

draw_set_color(c_navy);
draw_set_alpha(current_alpha / 100);
draw_rectangle(x + 16, y + 16, x + sprite_width - 17, y + sprite_height - 17, false);

draw_set_alpha(1);
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text(
    x + 24, y + sprite_height div 2 - 24,
    "Click area to toggle opacity"
    );

draw_set_color(current_alpha == target_alpha ? c_lime : c_orange);
draw_text(
    x + 24, y + sprite_height div 2,
    $"Current: {string_format(current_alpha, 0, 2)}%"
    );

draw_set_color(c_lime);
draw_text(
    x + 24, y + sprite_height div 2 + 24,
    $"Target: {string_format(target_alpha, 0, 2)}%"
    );

draw_set_color(c_white);
draw_set_alpha(1);
