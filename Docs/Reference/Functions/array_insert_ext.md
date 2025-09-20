[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# array_insert_ext

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L59)

Inserts items from one array into another array.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **dest** | **`Array`** | **Required** | The destination array to insert the items into. |
| **index** | **`Real`** | **Required** | The index in the destination array where the items should be inserted. |
| **source** | **`Array`** | **Required** | The source array with the items to insert. |
| **offset** | **`Real`** | Default: `0` | The offset of the source array to start taking items from. |
| **length** | **`Real`** | Default: `undefined` | The length of the source array subsection to insert. |

###### Returns
N/A

### Example

The following code inserts a commands block as upcoming dialogue commands, depending on the condition being met.

```gml
if (conditional_command.is_condition_met())
    array_insert_ext(dialogue_commands, 0, conditional_command.then_block);
else
    array_insert_ext(dialogue_commands, 0, conditional_command.else_block);
```

### Update history

- **24.6.0** - Created a function to insert items from an array into another array.
