[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# array_clone

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L38)

Creates a clone of the given array. The clone may be shallow (items are same between arrays) or deep (nested items are cloned, too).

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to clone. |
| **deep** | **`Bool`** | Default: `false` | Whether to make a deep or shallow clone (shallow by default). |

###### Returns
**`Array`**

### Example

The following code clones commands to be processed from a dialogue branch. Because the array is cloned, the dialogue system can remove items from the remaining commands without destroying the original branch.

```gml
remaining_commands = array_clone(dialogue_branch.commands);
```

### Update history

- **24.11.0** - Created a function to make a shallow or deep clone of a given array.
