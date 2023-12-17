draw_self();

var _text_x = x + 10;
var _text_y = y + 10;
var _text_width = sprite_width - 20;

draw_set_alpha(1);
draw_set_font(fnt_BasicText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// exit early with a basic message if the toolbox project isn't loading yet
if (is_undefined(toolbox_explorer)) {
    draw_set_color(c_orange);
    draw_text_ext(_text_x, _text_y, $"Load a toolbox project before proceeding", -1, _text_width);
    exit;
}

// draw generator report otherwise
draw_set_color(c_lime);

var _loaded_message = $"Loaded toolbox project from:\n{toolbox_path}";
draw_text_ext(_text_x, _text_y, _loaded_message, -1, _text_width);
_text_y += string_height_ext(_loaded_message, -1, _text_width) + 10;

var _processed = toolbox_explorer.processed_count;
var _total = toolbox_explorer.total_count;
var _progress_message = toolbox_explorer.is_completed ? "Toolbox project processed!" : $"{_processed}/{_total} scripts processed...";
draw_text_ext(_text_x, _text_y, _progress_message, -1, _text_width);
_text_y += string_height_ext(_progress_message, -1, _text_width) + 10;

// draw warnings
draw_set_color(c_orange);

for (var i = 0; i < array_length(warnings_log); i++) {
    draw_text_ext(_text_x, _text_y, warnings_log[i], -1, _text_width);
    _text_y += string_height_ext(warnings_log[i], -1, _text_width) + 10;
}
