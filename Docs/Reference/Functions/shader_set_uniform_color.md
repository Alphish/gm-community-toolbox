[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Shader utilities](/Docs/Reference/Groups/ShaderUtils.md)

# shader_set_uniform_color

(also: `shader_set_uniform_colour`)

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxShader/utils_CommunityToolboxShader.gml#L7)

Sets a shader uniform value to a 4-value vector representing an RGBA colour. Also available as `shader_set_uniform_colour`.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **uniform** | **`Id.Uniform`** | **Required** | The shader uniform to set the value of. |
| **color** | **`Constant.Color`** | **Required** | The RGB colour component. |
| **alpha** | **`Real`** | Default: `1` | The alpha component (1 by default). |

###### Returns
N/A

### Example

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

### Update history

- **23.4.0** - Created a function to easily pass colour parameters into shaders.
