draw_self();

var _is_toolbox_loaded = toolbox_path != "";

draw_set_alpha(1);
draw_set_color(_is_toolbox_loaded ? c_lime : c_orange);
draw_set_font(fnt_BasicText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(
    x + 10, y + 10,
    _is_toolbox_loaded
        ? "Loaded toolbox project from:\n" + toolbox_path
        : "Load a toolbox project before proceeding",
    -1, sprite_width - 20
    );
