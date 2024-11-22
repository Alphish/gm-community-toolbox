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
