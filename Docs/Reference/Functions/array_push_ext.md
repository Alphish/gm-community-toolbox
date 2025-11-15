[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# array_push_ext

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L65)

Pushes items from one array at the end of another array.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **dest** | **`Array`** | **Required** | The destination array to push the items to. |
| **source** | **`Array`** | **Required** | The source array with the items to push. |
| **offset** | **`Real`** | Default: `0` | The offset of the source array to start taking items from. |
| **length** | **`Real`** | Default: `undefined` | The length of the source array subsection to push. |

###### Returns
N/A

### Example

The following code moves all items from the chest to the inventory.

```gml
array_push_ext(global.inventory, chest_content);
array_clear(chest_content);
```

### Update history

- **24.6.0** - Created a function to push items from an array to another array.
