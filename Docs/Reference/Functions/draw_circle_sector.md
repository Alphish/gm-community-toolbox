[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_circle_sector

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L139)

Draws a circle sector (i.e. a pie slice shape) around the given center, with the given radius and between given angles.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the sector center. |
| **y** | **`Real`** | **Required** | The y coordinate of the sector center. |
| **radius** | **`Real`** | **Required** | The radius of the sector around the center. |
| **anglefrom** | **`Real`** | **Required** | The starting angle of the sector. |
| **angleto** | **`Real`** | **Required** | The ending angle of the sector. |
| **outline** | **`Bool`** | Default: `false` | Whether only the outline of the sector should be drawn or it should be filled. |
| **precision** | **`Real`** | Default: `24` | The precision of the circle the sector's arc is a part of. |

###### Returns
N/A

### Example

The following code draws faction proportions on a pie chart.

```gml
var _accumulated_count = 0;
for (var i = 0; i < array_length(factions); i++) {
    var _faction = factions[i];
    draw_set_color(_faction.color);

    var _anglefrom = 90 - 360 * _accumulated_count / total_count;
    var _angleto = 90 - 360 * (_accumulated_count + _faction.count) / total_count;
    draw_circle_sector(x, y, /* radius */ 200, _anglefrom, _angleto, /* outline */ false);
    
    _accumulated_count += _faction.count;
}
draw_set_color(c_white);
```

### Update history

- **24.6.0** - Created a function to draw a circle sector shape (i.e. a pie slice).
