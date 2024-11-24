@script <Collision> Collision utilities

@func <instance_position_top>

@section Example

The following code chooses the topmost (or frontmost) interactible instance in a point-and-click game, and potentially performs interactions on it.

```gml
hover_interactible = instance_position_top(mouse_x, mouse_y, par_Interactible);
with (hover_interactible) {
    other.tooltip = tooltip;
    if (mouse_check_button_pressed(mb_left))
        begin_interaction();
}
```

@update 24.6.0
Created a function to find the least-depth instance at the given position.

@func <instance_position_array>

@section Example

The following code uses the Lesser Eraser Tool to remove all editable instances at the mouse position.

```gml
instance_position_array(mouse_x, mouse_y, obj_Editable, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, instance_destroy);
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

@update 24.6.0
Created a function to populate an array with instances at the given position.

@func <instance_place_array>

@section Example

The following code uses the Greater Eraser Tool to remove all editable instances colliding with the Greater Eraser Sprite at the mouse position.

```gml
instance_place_array(mouse_x, mouse_y, obj_Editable, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, instance_destroy);
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

@update 24.6.0
Created a function to populate an array with instances colliding with the caller's mask at the given position.

@func <collision_point_array>

@section Example

The following code finds all enemy instances colliding with the Singularity spell area of effect and makes each of them take the appropriate damage.

```gml
collision_point_array(spell_x, spell_y, par_Enemy, /* precise */ true, /* notme */ false, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, function (_enemy) { _enemy.take_damage(999); });
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

@update 24.6.0
Created a function to populate an array with instances colliding with the given point.

@func <collision_circle_array>

@section Example

The following code finds all enemy instances colliding with the Explosion spell area of effect and makes each of them take the appropriate damage.

```gml
collision_circle_array(spell_x, spell_y, 80, par_Enemy, /* precise */ true, /* notme */ false, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, function (_enemy) { _enemy.take_damage(100); });
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

@update 24.6.0
Created a function to populate an array with instances colliding with the given circle.

@func <collision_line_array>

@section Example

The following code finds all enemy instances colliding with the X-Ray spell area of effect and makes each of them take the appropriate damage.

```gml
// the descending diagonal
collision_line_array(spell_x - 100, spell_y - 100, spell_x + 100, spell_y + 100, par_Enemy, /* precise */ true, /* notme */ false, global.collision_array, /* ordered */ false, /* replace */ true);

// the ascending diagonal; note how "replace" parameter is false to preserve the previous collisions
collision_line_array(spell_x - 100, spell_y + 100, spell_x + 100, spell_y - 100, par_Enemy, /* precise */ true, /* notme */ false, global.collision_array, /* ordered */ false, /* replace */ false);

array_unique_ext(global.collision_array); // avoid duplicates

array_foreach(global.collision_array, function (_enemy) { _enemy.take_damage(150); });
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

@update 24.6.0
Created a function to populate an array with instances colliding with the given line.

@func <collision_rectangle_array>

@section Example

The following code finds all enemy instances colliding with the Entwine spell area of effect and applies the "Immobile" status to each.

```gml
collision_rectangle_array(spell_x - 100, spell_y - 100, spell_x + 100, spell_y + 100, par_Enemy, /* precise */ true, /* notme */ false, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, function (_enemy) { _enemy.apply_status("Immobile"); });
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

@update 24.6.0
Created a function to populate an array with instances colliding with the given rectangle.

@func <collision_ellipse_array>

@section Example

The following code finds all enemy instances colliding with the Noxious Cloud spell area of effect and applies the "Poisoned" status to each.

```gml
collision_ellipse_array(spell_x - 200, spell_y - 100, spell_x + 200, spell_y + 100, par_Enemy, /* precise */ true, /* notme */ false, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, function (_enemy) { _enemy.apply_status("Poisoned"); });
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

@update 24.6.0
Created a function to populate an array with instances colliding with the given ellipse.
