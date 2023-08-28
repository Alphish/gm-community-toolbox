/// @func shader_set_uniform_color()
/// @desc Shortcut for passing a vec4 color uniform to a shader.
/// @arg {Id.Uniform} uniform
/// @arg {Constant.Color} color
/// @arg {Real} [alpha=1]
function shader_set_uniform_color(_uniform, _color, _alpha = 1) {
    var _r = color_get_red(_color) / 255;
    var _g = color_get_green(_color) / 255;
    var _b = color_get_blue(_color) / 255;
    shader_set_uniform_f(_uniform, _r, _g, _b, _alpha);
}
