the_array = [123, 45, 678, 901, 234, 56, 78, 90];
the_array_offset = 0;
the_array_length = undefined;
last_random_item = undefined;
find_delete_input = 0;

// ----------
// Indicators
// ----------

get_array_empty = function() {
    return array_empty(the_array);
}

get_array_max = function() {
    return array_max(the_array, the_array_offset, the_array_length);
}

get_array_min = function() {
    return array_min(the_array, the_array_offset, the_array_length);
}

get_array_median = function() {
    return array_median(the_array, the_array_offset, the_array_length);
}

get_array_mean = function() {
    return array_mean(the_array, the_array_offset, the_array_length);
}

get_array_sum = function() {
    return array_sum(the_array, the_array_offset, the_array_length);
}

get_array_find_output = function() {
    return array_find_item(the_array, function(_item) {
        return string_contains(string(_item), string(find_delete_input))
    }, the_array_offset, the_array_length);
}

// ----------
// Operations
// ----------

clear_array = function() {
    array_clear(the_array);
    recompute_values();
}

get_random_item = function() {
    last_random_item = array_get_random(the_array, the_array_offset, the_array_length);
}

pop_random_item = function() {
    last_random_item = array_pop_random(the_array, the_array_offset, the_array_length);
    recompute_values();
}

delete_input_item = function() {
    array_delete_item(the_array, find_delete_input, the_array_offset, the_array_length);
    recompute_values();
}

recompute_values = function() {
    with (ui_ArrayEditor) {
        synchronize();
    }
}

reset_defaults = function() {
    array_clear(the_array);
    array_push(the_array, 123, 45, 678, 901, 234, 56, 78, 90);
    
    the_array_offset = 0;
    the_array_length = undefined;
    last_random_item = undefined;
    
    recompute_values();
}
