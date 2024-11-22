[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_chord

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L172)

Draws a chord-like shape (i.e. a circle segment) around the given center, with the given radius and between given angles.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the chord center. |
| **y** | **`Real`** | **Required** | The y coordinate of the chord center. |
| **radius** | **`Real`** | **Required** | The radius of the chord around the center. |
| **anglefrom** | **`Real`** | **Required** | The starting angle of the chord. |
| **angleto** | **`Real`** | **Required** | The ending angle of the chord. |
| **outline** | **`Bool`** | Default: `false` | Whether only the outline of the chord should be drawn or it should be filled. |
| **precision** | **`Real`** | Default: `24` | The precision of the circle the chord's arc is a part of. |

###### Returns
N/A

### Example

The following code draws a cyan chord in front of the player if a forcefield ability is active, after the developer received feedback that the forcefield drawn with `draw_arc` is too thin.

```gml
draw_self();

if (forcefield_active) {
    draw_set_color_alpha(c_aqua, 0.5);
    draw_chord(x, y, /* radius */ 40, image_angle - 60, image_angle + 60, /* outline */ false);
    draw_set_color(c_white, 1);
}
```

### Update history

- **24.6.0** - Created a function to draw a disk segment shape.
