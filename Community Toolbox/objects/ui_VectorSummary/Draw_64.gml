draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(x, y, x + width - 1, y + height - 1, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(x, y, x + width - 1, y + height - 1, true);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_DemoInfo);
draw_text(
    x + 8,
    y + height div 2,
    $"Vector information:\n" +
    $"X component: {ctrl_Geometry.xdiff}\n" +
    $"Y component: {ctrl_Geometry.ydiff}\n" +
    $"vector_length({ctrl_Geometry.xdiff},{ctrl_Geometry.ydiff}) = {ctrl_Geometry.length}\n" +
    $"vector_direction({ctrl_Geometry.xdiff},{ctrl_Geometry.ydiff}) = {ctrl_Geometry.angle}\n"
    );
