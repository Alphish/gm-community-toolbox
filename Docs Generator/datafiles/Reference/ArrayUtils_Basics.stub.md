@region <Array:Basic operations> Basic operations

@func <is_nonempty_array>

@section Example

The following code applies a tags filter from a query struct if a non-empty array of tags is present.

```gml
if (is_nonempty_array(_query.tags)) {
    filter_assets_by_tags(_assets, _query.tags);
}
```

@update 24.11.0
Created a function to check if a value is an array that's not empty.

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

@func <array_find_item>

@section Example

The following code finds the first empty slot in the inventory and adds a newly collected item to it.

```gml
var _free_slot = array_find_item(inventory, function(_slot) { return is_undefined(_slot.item); });
_free_slot.item = _collected_item;
```

@update 24.11.0
Created a function to find the first array item meeting a condition.

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

@func <array_delete_item>

@section Example

The following code removes a component from its parent multi-part object when destroyed.

```gml
if (instance_exists(parent))
    array_delete(parent.components, id);
```

@update 24.11.0
Created a function to remove the first occurrence of an item in an array.

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