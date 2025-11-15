[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Other utilities](/Docs/Reference/Groups/MiscUtils.md) > [Nullish checks](/Docs/Reference/Groups/MiscUtils_Nullish.md)

# is_defined

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMisc/utils_CommunityToolboxMisc.gml#L18)

Checks whether a given value is not nullish (neither undefined nor pointer_null).

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **value** | **`Any`** | **Required** | The value to check. |

###### Returns
**`Bool`**

### Example

The following code lists all the existing inventory items, skipping empty slots.

```gml
var _nonempty_items = array_filter(global.inventory, is_defined);
array_foreach(_nonempty_items, show_debug_message);
```

### Update history

- **23.4.0** - Created a function to check if the given value is defined (not nullish).
