[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Euclidean division](/Docs/Reference/Groups/MethUtils_Euclidean.md)

# eucmod

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L8)

Calculates a remainder from the Euclidian division (the remainder will always be non-negative).

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **dividend** | **`Real`** | **Required** | The dividend (i.e. the value to get the remainder of). |
| **divisor** | **`Real`** | **Required** | The divisor (i.e. the value to divide by). |

###### Returns
**`Real`**

### Example

The following code shows using Euclidean division remainder to cycle through menu options. It properly handles negative selected index that occurs when the player pressed up arrow key starting from selected index of 0.

```gml
if (keyboard_check_pressed(vk_up))
    selected_index -= 1;

if (keyboard_check_pressed(vk_down))
    selected_index += 1;

selected_index = eucmod(selected_index, options_count);
```

### Update history

- **23.4.0** - Created a function to calculate the remainder of an Euclidean division.
