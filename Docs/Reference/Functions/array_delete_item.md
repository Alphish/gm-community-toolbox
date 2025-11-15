[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# array_delete_item

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L130)

Removes the first occurrence of a given item in the array or array subsection, if any. Returns whether the item has been found and deleted.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to remove the item from. |
| **item** | **`Any`** | **Required** | The item to remove from the array. |
| **offset** | **`Real`** | Default: `0` | The starting index of the array subsection to remove from. |
| **length** | **`Real`** | Default: `array_length(_array` | The length of the array subsection to remove from. |

###### Returns
**`Bool`**

### Example

The following code removes a component from its parent multi-part object when destroyed.

```gml
if (instance_exists(parent))
    array_delete(parent.components, id);
```

### Update history

- **24.11.0** - Created a function to remove the first occurrence of an item in an array.
