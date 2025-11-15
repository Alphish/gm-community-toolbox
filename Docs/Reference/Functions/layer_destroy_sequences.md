[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Layer utilities](/Docs/Reference/Groups/LayerUtils.md)

# layer_destroy_sequences

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxLayer/utils_CommunityToolboxLayer.gml#L29)

Destroys all sequences from the given layer.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **layer** | **`String,Id.Layer`** | **Required** | The layer to remove the elements from. |

###### Returns
N/A

### Example

The following code removes all sequence elements from the Intro layer.

```gml
layer_destroy_sequences("Intro");
```

### Update history

- **24.11.0** - Created a function to destroy all sequence elements in a given layer.
