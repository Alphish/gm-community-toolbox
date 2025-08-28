@region <Math:Geometry> Geometry

@func <vector_length>

@section Example

The following code calculates the total speed from its horizontal and vertical components and limits it if it exceeds the allowed maximum.

```gml
var _speed = vector_length(xspd, yspd);
if (_speed > speed_max) {
    var _multiplier = speed_max / _speed;
    xpsd *= _multiplier;
    yspd *= _multiplier;
}
```

@update 24.11.0
Created a function to calculate vector length from its X/Y components.

@func <vector_direction>

Calculates the direction a vector with given X/Y components points towards. Note that the Y component follows the computer graphics coordinates system, with Y axis pointing downwards (unlike in mathematics where Y axis typically points upwards).

@section Example

The following code rotates the player according to their speed vector, as calculated from its horizontal and vertical components.

```gml
image_angle = vector_direction(xspd, yspd);
```

@update 24.11.0
Created a function to calculate vector direction from its X/Y components.
