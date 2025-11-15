[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Fixed step approach](/Docs/Reference/Groups/MathUtils_Approach.md)

# approach

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L43)

Calculates the value a step closer to the target value. If the target is close enough, returns the target.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **current** | **`Real`** | **Required** | The current value. |
| **target** | **`Real`** | **Required** | The target value. |
| **step** | **`Real`** | Default: `1` | The step to approach the target by (1 by default). |

###### Returns
**`Real`**

### Example

The following code gradually moves an object towards its target coordinates by 5px along each axis.

```gml
x = approach(/* current value */ x, /* target value */ target_x, /* step */ 5);
y = approach(/* current value */ y, /* target value */ target_y, /* step */ 5);
```

### Update history

- **23.4.0** - Created a function to approach a given target value by a fixed step.
