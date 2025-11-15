[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Linear interpolation](/Docs/Reference/Groups/MathUtils_Lerp.md)

# unlerp

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L102)

Returns the interpolation amount such that lerp(from, to, amount) equals the given value.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **from** | **`Real`** | **Required** | The first value. |
| **to** | **`Real`** | **Required** | The second value. |
| **value** | **`Real`** | **Required** | The interpolated value. |

###### Returns
**`Real`**

### Example

The following code calculates level progress based on the player position between the start and the finish.

```gml
var _progress = unlerp(obj_StartingLine.x, obj_FinishLine.x, obj_Player.x);
var _progress_text = "Progress: " + string_format(_progress * 100, 0, 2) + "%";
draw_text(20, 20, _progress_text);
```

### Update history

- **23.4.0** - Created a function to retrieve the interpolation amount for the given value and range.
