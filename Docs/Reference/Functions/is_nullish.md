[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Other utilities](/Docs/Reference/Groups/MiscUtils.md) > [Nullish checks](/Docs/Reference/Groups/MiscUtils_Nullish.md)

# is_nullish

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMisc/utils_CommunityToolboxMisc.gml#L8)

Checks whether a given value is nullish (undefined or pointer_null) or not.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **value** | **`Any`** | **Required** | The value to check. |

###### Returns
**`Bool`**

### Example

The following code tries to read a name from a struct, and returns <unknown> if the read value is null or undefined.

```gml
var _name = _my_struct[$ "name"];
if (is_nullish(_name))
    return "<unknown>";
else
    return _name;
```

### Update history

- **23.4.0** - Created a function to check if the given value is nullish.
