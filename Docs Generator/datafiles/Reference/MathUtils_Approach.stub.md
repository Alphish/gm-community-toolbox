@region <Math:Fixed step approach> Fixed step approach

@func <approach>

@section Example

The following code gradually moves an object towards its target coordinates by 5px along each axis.

```gml
x = approach(/* current value */ x, /* target value */ target_x, /* step */ 5);
x = approach(/* current value */ y, /* target value */ target_y, /* step */ 5);
```

@update 23.4.0
Created a function to approach a given target value by a fixed step.

@func <approach_angle>

@section Example

The following code gradually turns the turret towards the player by 3 degrees each step, consistently preferring a shorter arc.

```gml
var _target_angle = point_direction(x, y, obj_Player.x, obj_Player.y);
image_angle = approach_angle(image_angle, _target_angle, 3);
```

@update 23.4.0
Created a function to approach a given angle by a fixed step.
