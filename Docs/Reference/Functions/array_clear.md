[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# array_clear

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L14)

Removes all items from the array.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to clear. |

###### Returns
N/A

### Example

The following code clears pending dialogue commands before adding new ones.

```gml
function dialogue_jump(_branch) {
    array_clear(ctrl_Dialogue.pending_commands);
    array_foreach(_branch.commands, function(_command) {
        array_push(ctrl_Dialogue.pending_commands, _command);
    });
}
```

### Update history

- **24.6.0** - Created a function to clear arrays.
