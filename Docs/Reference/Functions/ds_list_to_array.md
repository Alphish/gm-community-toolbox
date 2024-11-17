[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [DS List utilities](/Docs/Reference/Groups/DsList.md)

# ds_list_to_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDsList/utils_CommunityToolboxDsList.gml#L30)

Creates a new array with items from the given DS list.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **list** | **`Id.DsList`** | **Required** | The list to get the items from. |

###### Returns
**`Array`**

### Example

The following code shows converting a DS list from a legacy save system to an in-game array.

```gml
var _completed_levels_list = save_data[? "completed_levels"];
global.completed_levels = ds_list_to_array(_completed_levels_list);
```

### Update history

- **24.6.0** - Created a function to create an array from a DS list.
