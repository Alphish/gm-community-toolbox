draw_self();

var _text_x = x + 10;
var _text_y = y + 10;
var _text_width = sprite_width - 20;

draw_set_alpha(1);
draw_set_font(fnt_BasicText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// draw current state report
draw_set_color(c_lime);

var _loaded_message = $"Loaded toolbox project from:\n{project_path}";
draw_text_ext(_text_x, _text_y, _loaded_message, -1, _text_width);
_text_y += string_height_ext(_loaded_message, -1, _text_width) + 10;

draw_set_color(state.get_color());
var _message = state.get_message();
draw_text_ext(_text_x, _text_y, _message, -1, _text_width);
_text_y += string_height_ext(_message, -1, _text_width) + 10;

// draw failures
draw_set_color(c_orange);

for (var i = 0; i < array_length(failures_log); i++) {
    draw_text_ext(_text_x, _text_y, failures_log[i], -1, _text_width);
    _text_y += string_height_ext(failures_log[i], -1, _text_width) + 10;
}

// draw warnings
draw_set_color(c_yellow);

for (var i = 0; i < array_length(warnings_log); i++) {
    draw_text_ext(_text_x, _text_y, warnings_log[i], -1, _text_width);
    _text_y += string_height_ext(warnings_log[i], -1, _text_width) + 10;
}
