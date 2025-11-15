[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Collision utilities](/Docs/Reference/Groups/CollisionUtils.md)

# collision_point_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxCollision/utils_CommunityToolboxCollision.gml#L83)

Finds all instances of the given type colliding with the given point, then populates the given array. Returns the number of colliding instances found.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the collision point. |
| **y** | **`Real`** | **Required** | The y coordinate of the collision point. |
| **obj** | **`Asst.GMObject,Constant.All,Array,Id.TileMapElement`** | **Required** | The object(s) to check the collision of. |
| **prec** | **`Bool`** | **Required** | Whether the check is based on instances' masks (true) or bounding boxes (false). |
| **notme** | **`Bool`** | **Required** | Whether the calling instance may be returned as one of the colliding instances or not. |
| **array** | **`Array`** | **Required** | The array to populate with the colliding objects. |
| **ordered** | **`Bool`** | Default: `false` | Whether the instances should be sorted by the distance or not. |
| **replace** | **`Bool`** | Default: `false` | Whether to replace the contents of the array or only append them. |

###### Returns
**`Real`**

### Example

The following code finds all enemy instances colliding with the Singularity spell area of effect and makes each of them take the appropriate damage.

```gml
collision_point_array(spell_x, spell_y, par_Enemy, /* precise */ true, /* notme */ false, global.collision_array, /* ordered */ false, /* replace */ true);
array_foreach(global.collision_array, function (_enemy) { _enemy.take_damage(999); });
```

**Note:** `global.collision_array` is used for simple throwaway collision checks that are checked immediately and don't need to be reused afterwards.

### Update history

- **24.6.0** - Created a function to populate an array with instances colliding with the given point.
