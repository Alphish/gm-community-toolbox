[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_arc

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L45)

Draws a circular line around the given center, with the given radius and between given angles.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the arc center. |
| **y** | **`Real`** | **Required** | The y coordinate of the arc center. |
| **radius** | **`Real`** | **Required** | The radius of the arc around the center. |
| **anglefrom** | **`Real`** | **Required** | The starting angle of the arc. |
| **angleto** | **`Real`** | **Required** | The ending angle of the arc. |
| **precision** | **`Real`** | Default: `24` | The precision of the circle the arc is a part of. |

###### Returns
N/A

### Example

The following code draws a cyan arc line in front of the player if a forcefield ability is active.

```gml
draw_self();

if (forcefield_active) {
    draw_set_color(c_aqua);
    draw_arc(x, y, /* radius */ 40, image_angle - 60, image_angle + 60);
    draw_set_color(c_white);
}
```

### Update history

- **24.6.0** - Created a function to draw an arc line.
