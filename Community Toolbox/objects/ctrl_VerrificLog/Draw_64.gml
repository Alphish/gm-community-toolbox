if (instance_exists(ui_VerrificLogView))
    exit;

// showing a "loading tests" message if tests exploration is still in progress
var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

draw_set_alpha(1);
draw_set_color(pending_background);
draw_rectangle(0, 0, _gui_width, _gui_height, false);

draw_set_color(pending_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(text_font);
draw_text(_gui_width div 2, _gui_height div 2, "Loading tests, please wait...");
