title = "Array Utilities";
description = "Calculate the maximum, minimum, median, mean, and sum values of an array of numbers.";

the_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
input_array = -1;

the_array_display = "";
the_array_max = 0;
the_array_min = 0;
the_array_median = 0;
the_array_mean = 0;
the_array_sum = 0;

popup_input_array = function() {
    if (input_array == -1) {
        input_array = get_string_async("Enter a comma-separated list of numbers:", the_array_display);
    }
}

recompute_values = function() {
    the_array_display = string_join_ext(",", the_array);
    the_array_max = array_max(the_array);
    the_array_min = array_min(the_array);
    the_array_median = array_median(the_array);
    the_array_mean = array_mean(the_array);
    the_array_sum = array_sum(the_array);
}

recompute_values();

// Creating UI controls

instance_create_layer(32, 80, layer, ui_Button, {
    text: "Change Array", on_click: popup_input_array, image_xscale: 6
});
