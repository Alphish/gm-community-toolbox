@script <Struct> Struct utilities

@func <is_nonempty_struct>

@section Example

The following code checks if the save data contains a valid resources struct, and if not, uses a default one.

```gml
resources = is_nonempty_struct(_save_data[$ "resources"]) ? ResourcesStorage.create_from(_save_data.resources) : ResourcesStorage.create_default();
```

@update 24.11.0
Created a function to check if a value is a struct that's not empty.

@func <struct_clone>

Creates a clone of the given struct. The clone may be shallow (values are same between structs) or deep (nested values are cloned, too).

When deep cloning, recursive references should be mirrored - if a structure refers to itself directly or through one of its nested item, then the corresponding clone should refer to itself through the same path.

@section Example

The following code clones a random encounter monster data to serve as a base, then picks and applies random modifiers to change the monster's stats or attacks. Because the monster instance data is a deep clone of the base, the original data is unaffected while modifications are applied, including the attacks array.

```gml
data = struct_clone(monster_template.base_data, /*deep*/ true);

var _modifiers = array_shuffle(monster_template.available_modifiers);
repeat (3) {
    var _modifier = array_pop(_modifiers);
    _modifier.apply_to(data);
}
```

@update 24.11.0
Created a function to make a shallow or deep clone of a given struct.

@func <struct_assign>

@section Example

The following code sets up a newly created enemy with special values.

```gml
var _enemy = struct_assign(new WolfEnemy(), { name: "Howlington", hp: 500, atk: 100, behavior: "AttackLeastHP" })
```

@update 24.6.0
Created a function to assign contents of one struct (or sequence of structs) to another.
