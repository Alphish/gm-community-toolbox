[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [DS List utilities](/Docs/Reference/Groups/DsList.md)

# ds_list_add_to_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxDsList/utils_CommunityToolboxDsList.gml#L39)

Adds items from the given given DS list to the given array.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **list** | **`Id.DsList`** | **Required** | The list to get the items from. |
| **array** | **`Array`** | **Required** | The array to add the items to. |

###### Returns
N/A

### Example

The following code shows adding instances detected with `instance_position_list` to an array.

```gml
var _collision_list = ds_list_create();
instance_position_list(mouse_x, mouse_y, obj_Hoverable, _collision_list, false);
ds_list_add_to_array(hovered_instances, _collision_list);
```

### Update history

- **24.6.0** - Created a function to add items to an array from a DS list.
