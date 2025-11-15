[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [JSON utilities](/Docs/Reference/Groups/JsonUtils.md)

# json_load

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxJson/utils_CommunityToolboxJson.gml#L8)

Loads a given JSON file into a GML value (struct/array/string/real).

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **filename** | **`String`** | **Required** | The path of the JSON file to load. |
| **filter** | **`Function`** | Default: `undefined` | A filter function allowing more fine-grained control over parsing specific values. |
| **raw** | **`Bool`** | Default: `false` | Indicates whether special strings should be converted or treated as regular strings. |

###### Returns
**`Any`**

### Example

The following code shows a function to load game data from a save file for further processing.

```gml
function load_location() {
    var _result = {};
    
    var _save_data = json_load("save.dat");
    if (!is_struct(_save_data))
        return _result;
    
    var _room_name = asset_get_index(_save_data[$ "target_room"] ?? "");
    if (is_string(_room_name) && asset_get_type(_room_name) == asset_room)
        _result.target_room = asset_get_index(_room_name);
    
    if (is_real(_save_data[$ "x"]))
        _result.x = _save_data[$ "x"];
    
    if (is_real(_save_data[$ "y"]))
        _result.y = _save_data[$ "y"];
    
    return _result;
}
```

### Update history

- **24.6.1** - Fixed the JSDoc return type.
- **24.6.0** - Added the `filter` and `raw` parameters to additionally process parsed values.
- **23.4.1** - Tweaked the JSDocs.
- **23.4.0** - Created a function to read a JSON value from a file.
