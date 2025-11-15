[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# array_empty

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L18)

Checks if the given array has no items.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to check. |

###### Returns
**`Bool`**

### Example

The following code chooses the next target from the array, or `undefined` if none is available.

```gml
function get_next_target() {
    if (array_empty(global.available_targets))
        return undefined;
    else
        return array_shift(global.available_targets);
}
```

### Update history

- **24.6.0** - Created a function to check if an array is empty.
