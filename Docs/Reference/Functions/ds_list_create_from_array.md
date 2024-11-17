[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [DS List utilities](/Docs/Reference/Groups/DsList.md)

# ds_list_create_from_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDsList/utils_CommunityToolboxDsList.gml#L5)

Creates a new DS list with items from the given array.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to get the items from. |

###### Returns
**`Id.DsList`**

### Example

The following code shows converting an in-game array to a DS list for legacy save system.

```gml
var _completed_levels_list = ds_list_create_from_array(global.completed_levels);
ds_map_add_list(_save_data, "completed_levels", _completed_levels_list);
var _save_json = json_encode(_save_data);
```

### Update history

- **24.6.0** - Created a function to create a DS list from an array.
