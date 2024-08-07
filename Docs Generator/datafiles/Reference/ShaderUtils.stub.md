@script <Shader> Shader utilities

@func <shader_set_uniform_color>

Sets a shader uniform value to a 4-value vector representing an RGBA colour. Also available as `shader_set_uniform_colour`.

@section Example

The following code draws a regular sprite when not recently hit (no invincibility frames) and a red-overlaid version of the sprite after being recently hit (invincibility frames still available).

```gml
if (invincibility <= 0) {
    draw_sprite(sprite_index, image_index, x, y);
} else {
    shader_set(shd_overlay);
    shader_set_uniform_color(shader_get_uniform(shd_overlay, "u_color"), c_red, 1);
    draw_sprite(sprite_index, image_index, x, y);
    shader_reset();
}
```

@update 23.4.0
Created a function to easily pass colour parameters into shaders.
