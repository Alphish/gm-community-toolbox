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

@func <array_push_ext>

@section Example

The following code moves all items from the chest to the inventory.

```gml
array_push_ext(global.inventory, chest_content);
array_clear(chest_content);
```

@update 24.6.0
Created a function to push items from an array to another array.

@func <array_insert_ext>

@section Example

The following code inserts a commands block as upcoming dialogue commands, depending on the condition being met.

```gml
if (conditional_command.is_condition_met())
    array_insert_ext(dialogue_commands, 0, conditional_command.then_block);
else
    array_insert_ext(dialogue_commands, 0, conditional_command.else_block);
```

@update 24.6.0
Created a function to insert items from an array into another array.
