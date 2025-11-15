[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Settings](/Docs/Reference/Groups/DrawUtils_Settings.md)

# draw_set_align

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L30)

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

// reset the color
draw_set_color_alpha(c_white, 1);
```

### Update history

- **24.6.0** - Created a function to set horizontal and vertical text align at once.
