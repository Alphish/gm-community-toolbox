[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Layer utilities](/Docs/Reference/Groups/LayerUtils.md)

# layer_destroy_tilemaps

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxLayer/utils_CommunityToolboxLayer.gml#L57)

Destroys all tilemaps from the given layer.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **layer** | **`String,Id.Layer`** | **Required** | The layer to remove the elements from. |

###### Returns
N/A

### Example

The following code removes all tilemap elements from the Floor layer.

```gml
layer_destroy_tilemaps("Floor");
```

### Update history

- **24.11.0** - Created a function to destroy all tilemap elements in a given layer.
