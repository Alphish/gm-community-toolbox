[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawingUtils.md) > [Settings](/Docs/Reference/Groups/Drawing:Settings.md)

# draw_set_color_alpha

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDrawing/utils_CommunityToolboxDrawing.gml#L7)

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
    draw_set_color_alpha(c_white, 1);
}
```

### Update history

- **24.6.0** - Created a function to set color and alpha at once.
