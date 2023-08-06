draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(16, 16, title);
draw_text_ext(16, 48, description, -1, room_width - 320);

draw_text(
    16,
    144,
    $"array: {the_array_display}\n\n" +
    $"array_max(array): {the_array_max}\n" +
    $"array_min(array): {the_array_min}\n" +
    $"array_median(array): {the_array_median}\n" +
    $"array_mean(array): {the_array_mean}\n" +
    $"array_sum(array): {the_array_sum}\n"
    );

draw_text(
    672,
    144,
    $"offset: {the_array_offset}"
    );

draw_text(
    672,
    240,
    $"length: {the_array_length}"
    );

draw_text(
    16,
    400,
    $"last got random value: {last_value_get}\n" + 
    $"last popped random value: {last_value_pop}\n"
    );
