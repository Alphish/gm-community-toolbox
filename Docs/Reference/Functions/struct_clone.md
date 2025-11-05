[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Struct utilities](/Docs/Reference/Groups/StructUtils.md)

# struct_clone

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxStruct/utils_CommunityToolboxStruct.gml#L15)

Creates a clone of the given struct. The clone may be shallow (values are same between structs) or deep (nested values are cloned, too).

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **struct** | **`Struct`** | **Required** | The struct to clone. |
| **deep** | **`Bool`** | Default: `false` | Whether to make a deep or shallow clone (shallow by default). |

###### Returns
**`Struct`**

### Example

The following code clones a random encounter monster data to serve as a base, then picks and applies random modifiers to change the monster's stats or attacks. Because the monster instance data is a deep clone of the base, the original data is unaffected while modifications are applied, including the attacks array.

```gml
data = struct_clone(monster_template.base_data, /*deep*/ true);

var _modifiers = array_shuffle(monster_template.available_modifiers);
repeat (3) {
    var _modifier = array_pop(_modifiers);
    _modifier.apply_to(data);
}
```

### Update history

- **24.11.0** - Created a function to make a shallow or deep clone of a given struct.
