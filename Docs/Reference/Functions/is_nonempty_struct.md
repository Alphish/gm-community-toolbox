[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Struct utilities](/Docs/Reference/Groups/StructUtils.md)

# is_nonempty_struct

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxStruct/utils_CommunityToolboxStruct.gml#L6)

Checks if a given value is a struct that's not empty.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **value** | **`Any`** | **Required** | The value to check. |

###### Returns
**`Bool`**

### Example

The following code checks if the save data contains a valid resources struct, and if not, uses a default one.

```gml
resources = is_nonempty_struct(_save_data[$ "resources"]) ? ResourcesStorage.create_from(_save_data.resources) : ResourcesStorage.create_default();
```

### Update history

- **24.11.0** - Created a function to check if a value is a struct that's not empty.
