[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Settings](/Docs/Reference/Groups/DrawUtils_Settings.md)

# draw_set_color_alpha

(also: `draw_set_colour_alpha`)

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L8)

Sets the drawing color and alpha.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **color** | **`Constant.Color`** | **Required** | The drawing color to set. |
| **alpha** | **`Real`** | **Required** | The alpha to set (between 0 and 1). |

###### Returns
N/A

### Example

The following code draws a yellow semi-transparent rectangle over a hovered button.

```gml
draw_self();
if (position_meeting(mouse_x, mouse_y, id)) {
    draw_set_color_alpha(c_yellow, 0.3);
    draw_rectangle(x, y, x + sprite_width, y + sprite_height, false);
    
    // reset the color
    draw_set_color_alpha(c_white, 1);
}
```

### Update history

- **24.6.0** - Created a function to set color and alpha at once.
