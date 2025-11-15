[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_circle_segment

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L178)

Draws a circle segment (i.e. a bow-like shape) around the given center, with the given radius and between given angles.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the segment center. |
| **y** | **`Real`** | **Required** | The y coordinate of the segment center. |
| **radius** | **`Real`** | **Required** | The radius of the segment around the center. |
| **anglefrom** | **`Real`** | **Required** | The starting angle of the segment. |
| **angleto** | **`Real`** | **Required** | The ending angle of the segment. |
| **outline** | **`Bool`** | Default: `false` | Whether only the outline of the segment should be drawn or it should be filled. |
| **precision** | **`Real`** | Default: `24` | The precision of the circle the segment's arc is a part of. |

###### Returns
N/A

### Example

The following code draws a cyan circle segment in front of the player if a forcefield ability is active, after the developer received feedback that the forcefield drawn with `draw_arc` is too thin.

```gml
draw_self();

if (forcefield_active) {
    draw_set_color_alpha(c_aqua, 0.5);
    draw_circle_segment(x, y, /* radius */ 40, image_angle - 60, image_angle + 60, /* outline */ false);
    draw_set_color(c_white, 1);
}
```

### Update history

- **24.6.0** - Created a function to draw a circle segment shape (i.e. a bow).
