@script <Misc> Other utilities

@func <is_nullish>

@section Example

The following code tries to read a name from a struct, and returns <unknown> if the read value is null or undefined.

```gml
var _name = _my_struct[$ "name"];
if (is_nullish(_name))
    return "<unknown>";
else
    return _name;
```

@update 23.4.0
Created a function to check if the given value is nullish.

@func <is_defined>

@section Example

The following code lists all the existing inventory items, skipping empty slots.

```gml
var _nonempty_items = array_filter(global.inventory, is_defined);
array_foreach(_nonempty_items, show_debug_message);
```

@update 23.4.0
Created a function to check if the given value is defined (not nullish).
