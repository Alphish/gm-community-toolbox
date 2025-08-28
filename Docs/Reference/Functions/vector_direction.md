[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Geometry](/Docs/Reference/Groups/MathUtils_Geometry.md)

# vector_direction

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L138)

Calculates the direction a vector with given X/Y components points towards. Note that the Y component follows the computer graphics coordinates system, with Y axis pointing downwards (unlike in mathematics where Y axis typically points upwards). If both components are 0 (resulting in a zero-length vector), the returned angle is also 0.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The X (horizontal) component of the vector. |
| **y** | **`Real`** | **Required** | The Y (vertical) component of the vector. |

###### Returns
**`Real`**

### Example

The following code rotates the player according to their speed vector, as calculated from its horizontal and vertical components.

```gml
image_angle = vector_direction(xspd, yspd);
```

### Update history

- **24.11.0** - Created a function to calculate vector direction from its X/Y components.
