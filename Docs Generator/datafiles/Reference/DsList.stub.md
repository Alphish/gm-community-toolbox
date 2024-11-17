@script <DsList> DS List utilities

@func <ds_list_create_from_array>

@section Example

The following code shows converting an in-game array to a DS list for legacy save system.

```gml
var _completed_levels_list = ds_list_create_from_array(global.completed_levels);
ds_map_add_list(_save_data, "completed_levels", _completed_levels_list);
var _save_json = json_encode(_save_data);
```

@update 24.6.0
Created a function to create a DS list from an array.

@func <ds_list_add_from_array>

@update 24.6.0
Created a function to add items to a DS list from an array.

@func <ds_list_to_array>

@section Example

The following code shows converting a DS list from a legacy save system to an in-game array.

```gml
var _completed_levels_list = save_data[? "completed_levels"];
global.completed_levels = ds_list_to_array(_completed_levels_list);
```

@update 24.6.0
Created a function to create an array from a DS list.

@func <ds_list_add_to_array>

@section Example

The following code shows adding instances detected with `instance_position_list` to an array.

```gml
var _collision_list = ds_list_create();
instance_position_list(mouse_x, mouse_y, obj_Hoverable, _collision_list, false);
ds_list_add_to_array(hovered_instances, _collision_list);
```

@update 24.6.0
Created a function to add items to an array from a DS list.
