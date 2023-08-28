///@desc Draw title and result
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Title
draw_text(32, 32, "String utilities demo");

// Result
if (last_step_text != ui_StringText.text) {
    last_action();
    last_step_text = ui_StringText.text;
}
draw_text_ext(ui_StringText.bbox_left, ui_StringText.bbox_bottom+16, result, -1, ui_StringText.bbox_right-ui_StringText.bbox_left);