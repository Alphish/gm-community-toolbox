[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Struct utilities](/Docs/Reference/Groups/StructUtils.md)

# struct_assign

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxStruct/utils_CommunityToolboxStruct.gml#L31)

Assigns properties from one or more source structs to a destination struct, and returns the destination struct.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **destination** | **`Struct`** | **Required** | The struct to assign properties to. |
| **...sources** | **`Struct`** | Optional | The source structs to get properties values from. |

###### Returns
**`Struct`**

### Example

The following code sets up a newly created enemy with special values.

```gml
var _enemy = struct_assign(new WolfEnemy(), { name: "Howlington", hp: 500, atk: 100, behavior: "AttackLeastHP" })
```

### Update history

- **24.6.0** - Created a function to assign contents of one struct (or sequence of structs) to another.
