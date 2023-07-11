draw_track();

for (var i = 0; i < values_count; i++) {
    draw_tick_at(get_index_x(i));
}

var _thumb_x = is_dragged
    ? clamp(mouse_x - x, 0, track_width)
    : get_index_x(selected_index);
draw_thumb_at(_thumb_x);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var _value = variable_owner[$ variable_name];
draw_text(x + track_width + 40, y, $"{label}: {_value}");
