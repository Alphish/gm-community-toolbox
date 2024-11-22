[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawingUtils.md) > [Settings](/Docs/Reference/Groups/Drawing:Settings.md)

# draw_set_align

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDrawing/utils_CommunityToolboxDrawing.gml#L27)

Sets the horizontal and vertical alignment of the drawn text.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **halign** | **`Constant.HAlign`** | **Required** | The horizontal alignment to set. |
| **valign** | **`Constant.VAlign`** | **Required** | The vertical alignment to set. |

###### Returns
N/A

### Example

The following code draws text in the middle of a button.

```gml
draw_self();
draw_set_color_alpha(c_yellow, 1);
draw_set_align(fa_center, fa_middle);
draw_set_font(fnt_Button);
draw_text(x + sprite_width div 2, y + sprite_height div 2, "Click me!");
```

### Update history

- **24.6.0** - Created a function to set horizontal and vertical text align at once.
