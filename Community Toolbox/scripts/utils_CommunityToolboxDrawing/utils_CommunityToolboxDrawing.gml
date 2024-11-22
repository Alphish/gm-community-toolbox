#region Settings

/// @func draw_set_color_alpha(color,alpha)
/// @desc Sets the drawing color and alpha.
/// @arg {Constant.Color} color     The drawing color to set.
/// @arg {Real} alpha               The alpha to set (between 0 and 1).
function draw_set_color_alpha(_color, _alpha) {
    gml_pragma("forceinline");
    draw_set_color(_color);
    draw_set_alpha(_alpha);
}

/// @func draw_set_colour_alpha(colour,alpha)
/// @desc Sets the drawing colour and alpha.
/// @arg {Constant.Color} colour    The drawing colour to set.
/// @arg {Real} alpha               The alpha to set (between 0 and 1).
function draw_set_colour_alpha(_colour, _alpha) {
    gml_pragma("forceinline");
    draw_set_colour(_colour);
    draw_set_alpha(_alpha);
}

/// @func draw_set_align(halign,valign)
/// @desc Sets the horizontal and vertical alignment of the drawn text.
/// @arg {Constant.HAlign} halign       The horizontal alignment to set.
/// @arg {Constant.VAlign} valign       The vertical alignment to set.
function draw_set_align(_halign, _valign) {
    gml_pragma("forceinline");
    draw_set_halign(_halign);
    draw_set_valign(_valign);
}

#endregion
