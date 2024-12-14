@script <Json> JSON utilities

@func <json_load>

@section Example

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

@update 24.6.1
Fixed the JSDoc return type.

@update 24.6.0
Added the `filter` and `raw` parameters to additionally process parsed values.

@update 23.4.1
Tweaked the JSDocs.

@update 23.4.0
Created a function to read a JSON value from a file.

@func <json_save>

@section Example

The following code shows a function to save game data into a JSON file.

```gml
function save_location() {
    var _save_data = { target_room: room_get_name(room), x: obj_Player.x, y: obj_Player.y };
    json_save("save.dat", _save_data);
}
```

@update 24.6.0
Added the `filter` parameter to preprocess values before stringifying.

@update 23.4.1
Tweaked the JSDocs.

@update 23.4.0
Created a function to write a given value to a JSON file.
