the_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
the_array_offset = 0;
the_array_length = undefined;
last_random_item = undefined;

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

recompute_values = function() {
    with (ui_ArrayEditor) {
        synchronize();
    }
}

reset_defaults = function() {
    array_clear(the_array);
    array_push(the_array, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    
    the_array_offset = 0;
    the_array_length = undefined;
    last_random_item = undefined;
    
    recompute_values();
}
