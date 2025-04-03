draw_self();

draw_set_color(c_white);
draw_set_font(fnt_DemoInfo); 
draw_set_align(fa_left, fa_middle);

var _scope = keys_count == 0 ? "0/0" : $"{item_from + 1}-{item_to}/{keys_count}";

draw_text(x + margin_left, y + 16, $"{header} ({_scope})");
