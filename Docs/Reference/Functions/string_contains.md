[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [String utilities](/Docs/Reference/Groups/StringUtils.md)

# string_contains

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxString/utils_CommunityToolboxString.gml#L15)

Checks whether the given string contains the substring or not. Always returns true for an empty substringg.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **str** | **`String`** | **Required** | The string to find the substring in. |
| **substr** | **`String`** | **Required** | The string to check. |

###### Returns
**`Bool`**

### Example

The following example checks for an existence of a cuss word in the player name, and logs a message if one is found.

```gml
var _player_name = "Noname";
if (string_contains(_player_name, "cuss")) {
    show_debug_message("Indecent name entered! Please select another one...");
}
```

### Update history

- **24.6.0** - Created a function to check whether a given string contains the given substring.
