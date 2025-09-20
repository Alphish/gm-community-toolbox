[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [String utilities](/Docs/Reference/Groups/StringUtils.md)

# is_nonempty_string

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxString/utils_CommunityToolboxString.gml#L5)

Checks if a given value is a string that's not empty.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **value** | **`Any`** | **Required** | The value to check. |

###### Returns
**`Bool`**

### Example

The following code loads a name from the save data, or uses a default name if the data name is empty or not a string.

```gml
name = is_nonempty_string(_save_data[$ "name"]) ? _save_data.name : "Cloud";
```

### Update history

- **24.11.0** - Created a function to check if a value is a string that's not empty.
