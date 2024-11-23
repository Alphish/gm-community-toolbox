@region <Draw:Shapes> Shapes

@func <draw_arc>

@section Example

The following code draws a cyan arc line in front of the player if a forcefield ability is active.

```gml
draw_self();

if (forcefield_active) {
    draw_set_color(c_aqua);
    draw_arc(x, y, /* radius */ 40, image_angle - 60, image_angle + 60);
    draw_set_color(c_white);
}
```

@update 24.6.0
Created a function to draw an arc line.

@func <draw_circle_sector>

@section Example

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

@update 24.6.0
Created a function to draw a circle sector shape (i.e. a pie slice).

@func <draw_circle_segment>

@section Example

The following code draws a cyan circle segment in front of the player if a forcefield ability is active, after the developer received feedback that the forcefield drawn with `draw_arc` is too thin.

```gml
draw_self();

if (forcefield_active) {
    draw_set_color_alpha(c_aqua, 0.5);
    draw_circle_segment(x, y, /* radius */ 40, image_angle - 60, image_angle + 60, /* outline */ false);
    draw_set_color(c_white, 1);
}
```

@update 24.6.0
Created a function to draw a circle segment shape (i.e. a bow).

@func <draw_ring>

@section Example

The following code draws a red ring around the selected target.

```gml
draw_set_color(c_red);
draw_ring(selected_target.x, selected_target.y, /* radius 1 */ 55, /* radius 2 */ 60, /* outline */ false);
draw_set_color(c_white);
```

@update 24.6.0
Created a function to draw a ring shape.

@func <draw_ring_arc>

@section Example

The following code draws a circular healthbar.

```gml
draw_set_color(merge_color(c_red, c_green, hp / max_hp));

var _anglefrom = 90;
var _angleto = 90 - 360 * hp / max_hp;
draw_ring_arc(80, 80, /* radius 1 */ 40, /* radius 2 */ 60, _anglefrom, _angleto, /* outline */ false);

draw_set_color(c_white);
```

@update 24.6.0
Created a function to draw a ring slice shape.
