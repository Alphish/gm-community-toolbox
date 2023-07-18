///@desc Accept input for array
if (async_load[? "id"] == input_array) {
    if (async_load[? "status"]) {
        var _received_array = string_split(async_load[? "result"], ",");
        array_map_ext(_received_array, function(_v) {
            try {
                return real(_v);
            } catch (ex) {
                return undefined;
            }
        });
        the_array = array_filter(_received_array, function(_v) {
            return is_real(_v);
        });
        recompute_values();
    }
    input_array = -1;
}

///@desc Accept input for offset/length
if (async_load[? "id"] == input_offset_length) {
    if (async_load[? "status"]) {
        var _received_data = string_split(async_load[? "result"], ",");
        if (array_length(_received_data) == 2) {
			the_offset = real(_received_data[0]);
			the_length = real(_received_data[1]);
		}
    }
    input_offset_length = -1;
}
