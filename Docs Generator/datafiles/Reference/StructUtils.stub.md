@script <Struct> Struct utilities

@func <is_nonempty_struct>

@section Example

The following code checks if the save data contains a valid resources struct, and if not, uses a default one.

```gml
resources = is_nonempty_struct(_save_data[$ "resources"]) ? ResourcesStorage.create_from(_save_data.resources) : ResourcesStorage.create_default();
```

@update 24.11.0
Created a function to check if a value is a struct that's not empty.

@func <struct_assign>

@section Example

The following code sets up a newly created enemy with special values.

```gml
var _enemy = struct_assign(new WolfEnemy(), { name: "Howlington", hp: 500, atk: 100, behavior: "AttackLeastHP" })
```

@update 24.6.0
Created a function to assign contents of one struct (or sequence of structs) to another.
