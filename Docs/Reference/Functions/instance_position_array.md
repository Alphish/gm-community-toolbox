[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Collision utilities](/Docs/Reference/Groups/CollisionUtils.md)

# instance_position_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxCollision/utils_CommunityToolboxCollision.gml#L37)

Finds all instances of the given type at the given position, then populates the given array. Returns the number of colliding instances found.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the checked position. |
| **y** | **`Real`** | **Required** | The y coordinate of the checked position. |
| **obj** | **`Asst.GMObject,Constant.All,Array,Id.TileMapElement`** | **Required** | The object(s) to find at the given position. |
| **array** | **`Array`** | **Required** | The array to populate with the colliding objects. |
| **ordered** | **`Bool`** | Default: `false` | Whether the instances should be sorted by the distance or not. |
| **replace** | **`Bool`** | Default: `false` | Whether to replace the contents of the array or only append them. |

###### Returns
**`Real`**

### Example

The following code uses the Lesser Eraser Tool to remove all editable instances at the mouse position.

```gml
instance_position_array(mouse_x, mouse_y, obj_Editable, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, instance_destroy);
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

### Update history

- **24.6.0** - Created a function to populate an array with instances at the given position.
