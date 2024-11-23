[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_ring_arc

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L218)

Draws a ring slice around the given center, with the given radii and between given angles.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the ring center. |
| **y** | **`Real`** | **Required** | The y coordinate of the ring center. |
| **r1** | **`Real`** | **Required** | The radius of the first ring edge. |
| **r2** | **`Real`** | **Required** | The radius of the second ring edge. |
| **anglefrom** | **`Real`** | **Required** | The starting angle of the arc. |
| **angleto** | **`Real`** | **Required** | The ending angle of the arc. |
| **outline** | **`Bool`** | Default: `false` | Whether only the outline of the ring slice should be drawn or it should be filled. |
| **precision** | **`Real`** | Default: `24` | The precision of the ring the arc is a part of. |

###### Returns
N/A

### Example

The following code draws a circular healthbar.

```gml
draw_set_color(merge_color(c_red, c_green, hp / max_hp));

var _anglefrom = 90;
var _angleto = 90 - 360 * hp / max_hp;
draw_ring_arc(80, 80, /* radius 1 */ 40, /* radius 2 */ 60, _anglefrom, _angleto, /* outline */ false);

draw_set_color(c_white);
```

### Update history

- **24.6.0** - Created a function to draw a ring slice shape.
