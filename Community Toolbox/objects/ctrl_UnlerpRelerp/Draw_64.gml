///@desc Paint description and results
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(16, 16, "unlerp");
draw_text_ext(16, 36, "Returns the interpolation amount such that lerp(from, to, amount) equals the given value.", -1, room_width - 352);
draw_text(16, 222, $"amount: {unlerp_result}");

draw_text(16, 262, "relerp");
draw_text_ext(16, 278, "Given an interpolated value in the old range (oldfrom, oldto), returns its equivalent value in the new range (newfrom, newto).", -1, room_width - 352);
draw_text(640, 438, $"newvalue: {relerp_result}");
