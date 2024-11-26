@script <Struct> Struct utilities

@func <struct_assign>

@section Example

The following code sets up a newly created enemy with special values.

```gml
var _enemy = struct_assign(new WolfEnemy(), { name: "Howlington", hp: 500, atk: 100, behavior: "AttackLeastHP" })
```

@update 24.6.0
Created a function to assign contents of one struct (or sequence of structs) to another.
