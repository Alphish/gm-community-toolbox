[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Linear interpolation](/Docs/Reference/Groups/MathUtils_Lerp.md)

# lerp_angle

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L85)

Calculates the angle interpolated between a starting and destination angle for the given fraction amount.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **from** | **`Real`** | **Required** | The starting angle. |
| **to** | **`Real`** | **Required** | The destination angle. |
| **amount** | **`Real`** | **Required** | The amount to interpolate (0 matches the starting angle, 1 matches the destination angle). |

###### Returns
**`Real`**

### Example

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

### Update history

- **23.4.0** - Created a function to approach a given angle by a given fraction.
