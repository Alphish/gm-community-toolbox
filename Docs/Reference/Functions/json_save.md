[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [JSON utilities](/Docs/Reference/Groups/JsonUtils.md)

# json_save

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxJson/utils_CommunityToolboxJson.gml#L26)

Saves a given GML value (struct/array/string/real) into a JSON file.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **filename** | **`String`** | **Required** | The path of the JSON file to save. |
| **value** | **`Any`** | **Required** | The value to save as a JSON file. |
| **prettyprint** | **`Bool`** | Default: `false` | Whether to include indentations and newlines for readability (false by default). |
| **filter** | **`Function`** | Default: `undefined` | A filter function allowing more fine-grained control over formatting specific values. |

###### Returns
N/A

### Example

The following code shows a function to save game data into a JSON file.

```gml
function save_location() {
    var _save_data = { target_room: room_get_name(room), x: obj_Player.x, y: obj_Player.y };
    json_save("save.dat", _save_data);
}
```

### Update history

- **24.6.0** - Added the `filter` parameter to preprocess values before stringifying.
- **23.4.1** - Tweaked the JSDocs.
- **23.4.0** - Created a function to write a given value to a JSON file.
