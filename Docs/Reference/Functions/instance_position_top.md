[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Collision utilities](/Docs/Reference/Groups/CollisionUtils.md)

# instance_position_top

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxCollision/utils_CommunityToolboxCollision.gml#L7)

Finds the instance colliding with the given point at the least depth. If none is found, noone is returned.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **x** | **`Real`** | **Required** | The x coordinate of the point to check. |
| **y** | **`Real`** | **Required** | The y coordinate of the point to check. |
| **obj** | **`Asset.GMObject, Constant.All, Array`** | **Required** | The object(s) to find at the given point. |

###### Returns
**`Id.Instance`**

### Example

The following code chooses the topmost (or frontmost) interactible instance in a point-and-click game, and potentially performs interactions on it.

```gml
hover_interactible = instance_position_top(mouse_x, mouse_y, par_Interactible);
with (hover_interactible) {
    other.tooltip = tooltip;
    if (mouse_check_button_pressed(mb_left))
        begin_interaction();
}
```

### Update history

- **24.6.0** - Created a function to find the least-depth instance at the given position.
