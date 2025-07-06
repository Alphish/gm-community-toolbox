[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Layer utilities](/Docs/Reference/Groups/LayerUtils.md)

# layer_destroy_backgrounds

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxLayer/utils_CommunityToolboxLayer.gml#L39)

Destroys all backgrounds from the given layer.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **layer** | **`String,Id.Layer`** | **Required** | The layer to remove the elements from. |

###### Returns
N/A

### Example

The following code removes all background elements from the Background layer.

```gml
layer_destroy_backgrounds("Background");
```

### Update history

- **24.11.0** - Created a function to destroy all background elements in a given layer.
