[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Linear interpolation](/Docs/Reference/Groups/MathUtils_Lerp.md)

# relerp

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L111)

Given an interpolated value in the old range (oldfrom, oldto), returns its equivalent value in the new range (newfrom, newto).

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **oldfrom** | **`Real`** | **Required** | The old range's first value. |
| **oldto** | **`Real`** | **Required** | The old range's second value. |
| **oldvalue** | **`Real`** | **Required** | The value to re-interpolate. |
| **newfrom** | **`Real`** | **Required** | The new range's first value. |
| **newto** | **`Real`** | **Required** | The new range's second value. |

###### Returns
**`Real`**

### Example

The following code calculates the rating (from 1 to 6) based on the mouse position relative to the slider.

```gml
var _slider_left = x;
var _slider_right = x + sprite_width;
var _min_rating = 1;
var _max_rating = 6;
var _rating_raw = relerp(_slider_left, _slider_right, mouse_x, _min_rating, _max_rating);
global.current_rating = clamp(round(_rating_raw), _min_rating, _max_rating);
```

### Update history

- **23.4.0** - Created a function to convert a value in one range to a corresponding value in another range.
