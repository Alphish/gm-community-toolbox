[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# array_find_item

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L31)

Finds the first item in the given array or array subsection that satisfies the given condition. If no item is found, undefined is returned.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to find the item in. |
| **predicate** | **`Function`** | **Required** | The function to check the search condition with. |
| **offset** | **`Real`** | Default: `0` | The starting index of the searched array subsection. |
| **length** | **`Real`** | Default: `array_length(_array` | The length of the searched array subsection. |

###### Returns
**`Any`**

### Example

The following code finds the first empty slot in the inventory and adds a newly collected item to it.

```gml
var _free_slot = array_find_item(inventory, function(_slot) { return is_undefined(_slot.item); });
_free_slot.item = _collected_item;
```

### Update history

- **24.11.0** - Created a function to find the first array item meeting a condition.
