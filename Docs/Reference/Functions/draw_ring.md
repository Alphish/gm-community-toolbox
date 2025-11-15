[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_ring

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L206)

Draws a ring shape (an area between two circles) around the given center and with the given radii.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the ring center. |
| **y** | **`Real`** | **Required** | The y coordinate of the ring center. |
| **r1** | **`Real`** | **Required** | The radius of the first ring edge. |
| **r2** | **`Real`** | **Required** | The radius of the second ring edge. |
| **outline** | **`Bool`** | Default: `false` | Whether only the outline of the ring should be drawn or it should be filled. |
| **precision** | **`Real`** | Default: `24` | The precision of the ring. |

###### Returns
N/A

### Example

The following code draws a red ring around the selected target.

```gml
draw_set_color(c_red);
draw_ring(selected_target.x, selected_target.y, /* radius 1 */ 55, /* radius 2 */ 60, /* outline */ false);
draw_set_color(c_white);
```

### Update history

- **24.6.0** - Created a function to draw a ring shape.
