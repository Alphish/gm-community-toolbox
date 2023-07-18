title = "Array Utilities";

description = "Calculate the maximum, minimum, median, mean, and sum values of an array of numbers.";
description2 = "Get or pop a random element from the array";

default_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
the_array = [];

input_array = -1;
input_offset_length = -1;

the_array_display = "";
the_array_max = 0;
the_array_min = 0;
the_array_median = 0;
the_array_mean = 0;
the_array_sum = 0;

the_offset = 0;
the_length = array_length(default_array);
last_random_elements = [];
distribution = {};

the_offset_length_display = string("{0}, {1}", the_offset, the_length);

popup_input_array = function() {
    if (input_array == -1) {
        input_array = get_string_async("Enter a comma-separated list of numbers:", the_array_display);
    }
}

change_offset_length = function() {
	if (input_offset_length == -1) {
        input_offset_length = get_string_async("Enter offset and length", the_offset_length_display);
    }
}

get_random = function() {
	var _elem = array_get_random(the_array, the_offset, the_length);
	distribution[$ _elem]++;
	array_push(last_random_elements, _elem);
}

get_random_1000 = function() {
	repeat(1000) {
		get_random();
	}
}


pop_random = function() {
	var _elem = array_pop_random(the_array, the_offset, the_length);
	if (!is_undefined(_elem)) distribution[$ _elem]++;
	array_push(last_random_elements, _elem);
	recompute_values();
}

recompute_values = function() {
    the_array_display = string_join_ext(",", the_array);
    the_array_max = array_max(the_array);
    the_array_min = array_min(the_array);
    the_array_median = array_median(the_array);
    the_array_mean = array_mean(the_array);
    the_array_sum = array_sum(the_array);
}

reset_array = function() {
    array_copy(the_array, 0, default_array, 0, array_length(default_array));
	last_random_elements = [];
	distribution = {};
	for (var _i=0, _n = array_length(the_array); _i<_n; _i++) {
		distribution[$ the_array[_i]] = 0;
	}
	recompute_values();
}

reset_array();

// Creating UI controls

instance_create_layer(32, 80, layer, ui_Button, {
    text: "Change Array", on_click: popup_input_array, image_xscale: 6
});


instance_create_layer(256, 80, layer, ui_Button, {
    text: "Reset Array", on_click: reset_array, image_xscale: 6
});

instance_create_layer(32, 350, layer, ui_Button, {
    text: "Change Offset/Length", on_click: change_offset_length, image_xscale: 6
});

instance_create_layer(256, 350, layer, ui_Button, {
    text: "Get Random Element", on_click: get_random, image_xscale: 6
});



instance_create_layer(256+224, 350, layer, ui_Button, {
    text: "Get 1000 Random", on_click: get_random_1000, image_xscale: 6
});


instance_create_layer(256+224*2, 350, layer, ui_Button, {
    text: "Pop Random Element", on_click: pop_random, image_xscale: 6
});


