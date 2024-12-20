title = "Array Utilities";
description =
    "Calculates the maximum, minimum, median, mean, and sum of an array.\n" +
    "Also, allows getting/popping random values from the array.";

the_original_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

reset_defaults = function() {
    input_array = -1;
    input_offset = -1;
    input_length = -1;

    the_array = [];
    array_copy(the_array, 0, the_original_array, 0, array_length(the_original_array));

    the_array_display = "";
    the_array_max = 0;
    the_array_min = 0;
    the_array_median = 0;
    the_array_mean = 0;
    the_array_sum = 0;

    the_array_offset = 0;
    the_array_length = undefined;

    last_value_get = undefined;
    last_value_pop = undefined;
    the_array_empty = "Array is not empty";
    
    recompute_values();
}


popup_input_array = function() {
    if (input_array == -1) {
        input_array = get_string_async("Enter a comma-separated list of numbers:", the_array_display);
    }
}

set_array_offset = function() {
    if (input_offset == -1) {
        input_offset = get_string_async("Enter the offset to consider for operations:", string(the_array_offset));
    }
}

set_array_length = function() {
    if (input_length == -1) {
        input_length = get_string_async("Enter the length to consider for operations:", string(the_array_length));
    }
}

get_random_array = function() {
    last_value_get = array_get_random(the_array, the_array_offset, the_array_length);
}

pop_random_array = function() {
    last_value_pop = array_pop_random(the_array, the_array_offset, the_array_length);
    recompute_values();
}

clear_the_array = function() {
    array_clear(the_array);
    recompute_values();
}

recompute_values = function() {
    the_array_display = string_join_ext(",", the_array);
    the_array_max = array_max(the_array, the_array_offset, the_array_length);
    the_array_min = array_min(the_array, the_array_offset, the_array_length);
    the_array_median = array_median(the_array, the_array_offset, the_array_length);
    the_array_mean = array_mean(the_array, the_array_offset, the_array_length);
    the_array_sum = array_sum(the_array, the_array_offset, the_array_length);
    the_array_empty = array_empty(the_array) ? "Array is empty" : "Array is not empty";
}

reset_defaults();


// Creating UI controls

instance_create_layer(32, 96, layer, ui_Button, {
    text: "Change Array", on_click: popup_input_array, image_xscale: 6
});

instance_create_layer(672, 96, layer, ui_Button, {
    text: "Set offset", on_click: set_array_offset, image_xscale: 6
});

instance_create_layer(672, 192, layer, ui_Button, {
    text: "Set length", on_click: set_array_length, image_xscale: 6
});



instance_create_layer(32, 316, layer, ui_Button, {
    text: "Get Random", on_click: get_random_array, image_xscale: 6
});

instance_create_layer(256+32, 316, layer, ui_Button, {
    text: "Pop Random", on_click: pop_random_array, image_xscale: 6
});

instance_create_layer(256*2+32, 316, layer, ui_Button, {
    text: "Reset to Defaults", on_click: reset_defaults, image_xscale: 6
});
