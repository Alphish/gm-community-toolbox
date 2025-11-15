[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Layer utilities](/Docs/Reference/Groups/LayerUtils.md)

# layer_destroy_text

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxLayer/utils_CommunityToolboxLayer.gml#L17)

Destroys all text elements from the given layer.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **layer** | **`String,Id.Layer`** | **Required** | The layer to remove the elements from. |

###### Returns
N/A

### Example

The following code removes all text elements from the Instructions layer.

```gml
layer_destroy_text("Instructions");
```

### Update history

- **24.11.0** - Created a function to destroy all text elements in a given layer.
