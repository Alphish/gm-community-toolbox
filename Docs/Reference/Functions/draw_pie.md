[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Drawing utilities](/Docs/Reference/Groups/DrawUtils.md) > [Shapes](/Docs/Reference/Groups/DrawUtils_Shapes.md)

# draw_pie

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDraw/utils_CommunityToolboxDraw.gml#L134)

Draws a pie-like shape (i.e. a circle sector) around the given center, with the given radius and between given angles.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the pie center. |
| **y** | **`Real`** | **Required** | The y coordinate of the pie center. |
| **radius** | **`Real`** | **Required** | The radius of the pie around the center. |
| **anglefrom** | **`Real`** | **Required** | The starting angle of the pie. |
| **angleto** | **`Real`** | **Required** | The ending angle of the pie. |
| **outline** | **`Bool`** | Default: `false` | Whether only the outline of the pie should be drawn or it should be filled. |
| **precision** | **`Real`** | Default: `24` | The precision of the circle the pie's arc is a part of. |

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
    draw_pie(x, y, /* radius */ 200, _anglefrom, _angleto, /* outline */ false);
    
    _accumulated_count += _faction.count;
}
draw_set_color(c_white);
```

### Update history

- **24.6.0** - Created a function to draw a pie slice shape.
