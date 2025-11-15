[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Fixed step approach](/Docs/Reference/Groups/MathUtils_Approach.md)

# approach_angle

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L61)

Calculates the angle (in degrees) a step closer to the target angle. If the target is close enough, returns the target.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **current** | **`Real`** | **Required** | The current angle. |
| **target** | **`Real`** | **Required** | The target angle. |
| **step** | **`Real`** | Default: `1` | The step to approach the target by (1 by default). |

###### Returns
N/A

### Example

The following code gradually turns the turret towards the player by 3 degrees each step, consistently preferring a shorter arc.

```gml
var _target_angle = point_direction(x, y, obj_Player.x, obj_Player.y);
image_angle = approach_angle(image_angle, _target_angle, 3);
```

### Update history

- **23.4.1** - Tweaked the JSDocs.
- **23.4.0** - Created a function to approach a given angle by a fixed step.
