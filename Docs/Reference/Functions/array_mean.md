[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Number array statistics](/Docs/Reference/Groups/ArrayUtils_Maths.md)

# array_mean

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L220)

Returns the average value of numbers in the array or its subsection. If the array/subsection is empty, 0 is returned.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array<Real>`** | **Required** | The array to get the mean value of. |
| **offset** | **`Real`** | Default: `0` | The starting index of the subsection (for a negative offset, it will count from array end). |
| **length** | **`Real`** | Default: `undefined` | The length of the subsection (for a negative length, it will count backwards from the offset position). |

###### Returns
**`Real`**

### Example

The following code finds the mean level in the party:

```gml
var _heroes = [
    { name: "Alice", level: 14, gold: 165 },
    { name: "Bob", level: 16, gold: 546 },
    { name: "Charlie", level: 9, gold: 1753 },
    ];
var _levels = array_map(_heroes, function(_hero) { return _hero.level; });
var _mean_level = array_mean(_levels);
show_debug_message(_mean_level);
```

### Update history

- **23.4.0** - Created a function to calculate the average value of the numbers array values.
