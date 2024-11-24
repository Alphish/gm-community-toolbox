[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Collision utilities](/Docs/Reference/Groups/CollisionUtils.md)

# instance_place_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxCollision/utils_CommunityToolboxCollision.gml#L56)

Finds all instances of the given type colliding with the caller's collision mask at the given position, then populates the given array. Returns the number of colliding instances found.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the checked placement |
| **y** | **`Real`** | **Required** | The y coordinate of the checked placement. |
| **obj** | **`Asst.GMObject,Constant.All,Array,Id.TileMapElement`** | **Required** | The object(s) to check the collision of. |
| **array** | **`Array`** | **Required** | The array to populate with the colliding objects. |
| **ordered** | **`Bool`** | Default: `false` | Whether the instances should be sorted by the distance or not. |
| **replace** | **`Bool`** | Default: `false` | Whether to replace the contents of the array or only append them. |

###### Returns
**`Real`**

### Example

The following code uses the Greater Eraser Tool to remove all editable instances colliding with the Greater Eraser Sprite at the mouse position.

```gml
instance_place_array(mouse_x, mouse_y, obj_Editable, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, instance_destroy);
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

### Update history

- **24.6.0** - Created a function to populate an array with instances colliding with the caller's mask at the given position.
