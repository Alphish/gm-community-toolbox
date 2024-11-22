[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_arc_range

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L201)

Draws a band-like shape between two arcs around the given center, with the given radii and between given angles.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the chord center. |
| **y** | **`Real`** | **Required** | The y coordinate of the chord center. |
| **r1** | **`Real`** | **Required** | The first radius to draw the band between. |
| **r2** | **`Real`** | **Required** | The second radius to draw the band between. |
| **anglefrom** | **`Real`** | **Required** | The starting angle of the arcs. |
| **angleto** | **`Real`** | **Required** | The ending angle of the arcs. |
| **outline** | **`Bool`** | Default: `false` | Whether only the outline of the band should be drawn or it should be filled. |
| **precision** | **`Real`** | Default: `24` | The precision of the circles the band is drawn between. |

###### Returns
N/A

### Example

The following code draws a circular healthbar.

```gml
draw_set_color(merge_color(c_red, c_green, hp / max_hp));

var _anglefrom = 90;
var _angleto = 90 - 360 * hp / max_hp;
draw_arc_range(80, 80, /* radius 1 */ 40, /* radius 2 */ 60, _anglefrom, _angleto, /* outline */ false);

draw_set_color(c_white);
```

### Update history

- **24.6.0** - Created a function to draw a pie slice shape.
