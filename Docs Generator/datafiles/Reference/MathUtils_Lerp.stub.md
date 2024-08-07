@region <Math:Linear interpolation> Linear interpolation

@func <lerp_angle>

@section Example

The following code gradually turns the turret towards the player by about 10% of the angle difference, but also no less than 1 degree (unless the angle difference is smaller).

```gml
var _target_angle = point_direction(x, y, obj_Player.x, obj_Player.y);

// approaching the target angle by 10% of the difference
image_angle = lerp_angle(image_angle, _target_angle, 0.10);

// approaching the target angle by 1 degree
// this ensures that the target angle is eventually reached, as long as remains the same for enough time
// lerp_angle on its own would get really close, but in practice never quite reach the target value
image_angle = approach_angle(image_angle, _target_angle, 1);
```

@update 23.4.0
Created a function to approach a given angle by a given fraction.

@func <unlerp>

@section Example

The following code calculates level progress based on the player position between the start and the finish.

```gml
var _progress = unlerp(obj_StartingLine.x, obj_FinishLine.x, obj_Player.x);
var _progress_text = "Progress: " + string_format(_progress * 100, 0, 2) + "%";
draw_text(20, 20, _progress_text);
```

@update 23.4.0
Created a function to retrieve the interpolation amount for the given value and range.

@func <relerp>

@section Example

The following code calculates the rating (from 1 to 6) based on the mouse position relative to the slider.

```gml
var _slider_left = x;
var _slider_right = x + sprite_width;
var _min_rating = 1;
var _max_rating = 6;
var _rating_raw = relerp(_slider_left, _slider_right, mouse_x, _min_rating, _max_rating);
global.current_rating = clamp(round(_rating_raw), _min_rating, _max_rating);
```

@update 23.4.0
Created a function to convert a value in one range to a corresponding value in another range.
