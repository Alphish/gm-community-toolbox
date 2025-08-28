[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Geometry](/Docs/Reference/Groups/MathUtils_Geometry.md)

# vector_length

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L128)

Calculates the length of a vector with given X/Y components.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The X (horizontal) component of the vector. |
| **y** | **`Real`** | **Required** | The Y (vertical) component of the vector. |

###### Returns
**`Real`**

### Example

The following code calculates the total speed from its horizontal and vertical components and limits it if it exceeds the allowed maximum.

```gml
var _speed = vector_length(xspd, yspd);
if (_speed > speed_max) {
    var _multiplier = speed_max / _speed;
    xpsd *= _multiplier;
    yspd *= _multiplier;
}
```

### Update history

- **24.11.0** - Created a function to calculate vector length from its X/Y components.
