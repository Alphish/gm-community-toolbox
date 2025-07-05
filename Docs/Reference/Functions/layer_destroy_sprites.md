[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Layer utilities](/Docs/Reference/Groups/LayerUtils.md)

# layer_destroy_sprites

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxLayer/utils_CommunityToolboxLayer.gml#L4)

Destroys all sprite elements from the given layer.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **layer** | **`String,Id.Layer`** | **Required** | The layer to remove the elements from. |

###### Returns
N/A

### Example

The following code removes all sprite elements from the Decorations layer.

```gml
layer_destroy_sprites("Decorations");
```

### Update history

- **24.11.0** - Created a function to destroy all sprite elements in a given layer.
