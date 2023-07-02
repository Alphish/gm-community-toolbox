event_inherited();

draw_set_alpha(1);
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text(
    x + 24, y + sprite_height div 2 - 24,
    "Click area to change number"
    );

draw_set_color(current_number == target_number ? c_lime : c_orange);
draw_text(
    x + 24, y + sprite_height div 2,
    $"Current: {string_format(current_number, 10, 0)}"
    );

draw_set_color(c_lime);
draw_text(
    x + 24, y + sprite_height div 2 + 24,
    $" Target: {string_format(target_number, 10, 0)}"
    );

draw_set_color(c_white);
draw_set_alpha(1);
