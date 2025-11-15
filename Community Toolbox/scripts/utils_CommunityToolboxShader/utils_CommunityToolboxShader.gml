/// @func shader_set_uniform_color(uniform,color,[alpha])
/// @url http://github.com/Alphish/gm-community-toolbox/blob/main/Docs/Reference/Functions/shader_set_uniform_color.md
/// @desc Sets a shader uniform value to a vec4 representing an RGBA colour.
/// @arg {Id.Uniform} uniform       The shader uniform to set the value of.
/// @arg {Constant.Color} color     The RGB colour component.
/// @arg {Real} [alpha]             The alpha component (1 by default).
function shader_set_uniform_color(_uniform, _color, _alpha = 1) {
    var _r = color_get_red(_color) / 255;
    var _g = color_get_green(_color) / 255;
    var _b = color_get_blue(_color) / 255;
    shader_set_uniform_f(_uniform, _r, _g, _b, _alpha);
}

/// @func shader_set_uniform_colour(uniform,colour,[alpha])
/// @url http://github.com/Alphish/gm-community-toolbox/blob/main/Docs/Reference/Functions/shader_set_uniform_color.md
/// @desc Sets a shader uniform value to a vec4 representing an RGBA colour.
/// @arg {Id.Uniform} uniform       The shader uniform to set the value of.
/// @arg {Constant.Color} colour    The RGB colour component.
/// @arg {Real} [alpha]             The alpha component (1 by default).
function shader_set_uniform_colour(_uniform, _colour, _alpha = 1) {
    gml_pragma("forceinline");
    shader_set_uniform_color(_uniform, _colour, _alpha);
}
