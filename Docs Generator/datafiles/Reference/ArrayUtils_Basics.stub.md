@region <Array:Basic operations> Basic operations

@func <array_empty>

@section Example

The following code chooses the next target from the array, or `undefined` if none is available.

```gml
function get_next_target() {
    if (array_empty(global.available_targets))
        return undefined;
    else
        return array_shift(global.available_targets);
}
```

@update 24.6.0
Created a function to check if an array is empty.

@func <array_clear>

@section Example

The following code clears pending dialogue commands before adding new ones.

```gml
function dialogue_jump(_branch) {
    array_clear(ctrl_Dialogue.pending_commands);
    array_foreach(_branch.commands, function(_command) {
        array_push(ctrl_Dialogue.pending_commands, _command);
    });
}
```

@update 24.6.0
Created a function to clear arrays.
