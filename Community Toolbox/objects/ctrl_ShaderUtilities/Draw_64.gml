///@desc Paint description and results
draw_set_font(fnt_DemoInfo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(16, 16, "shader_set_uniform_color");
draw_text_ext(16, 36, "Pass a color uniform to a shader.", -1, room_width - 352);

shader_set(shd_overlay);
shader_set_uniform_color(shader_get_uniform(shd_overlay, "u_color"), make_color_rgb(red, green, blue), alpha);
draw_sprite(spr_ShaderDemo, 0, 96, 380);
shader_reset();