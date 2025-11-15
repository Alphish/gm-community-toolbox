[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Struct utilities](/Docs/Reference/Groups/StructUtils.md)

# struct_filter

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxStruct/utils_CommunityToolboxStruct.gml#L49)

Creates a new filtered struct from existing one, with entries meeting the given predicate condition.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **struct** | **`Struct`** | **Required** | The struct to filter entries from. |
| **predicate** | **`Function`** | **Required** | The predicate to check struct entries (key-value pairs). |

###### Returns
**`Struct`**

### Example

The following code filters out struct entries with values other than true, so that the keys with the true value can be saved.

```gml
var _upgrades_collected = struct_filter(upgrades_state, function(_key, _value) { return _value == true; });
var _upgrades_names = struct_get_names(_upgrades_collected); // get the upgrade names for saving
```

### Update history

- **24.11.0** - Created a function to make a struct with filtered entries.
