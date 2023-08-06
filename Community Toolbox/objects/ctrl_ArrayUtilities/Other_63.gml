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

if (async_load[? "id"] == input_offset) {
    if (async_load[? "status"]) {
        try {
            the_array_offset = real(async_load[? "result"]);
        }
        catch (ex) {}
        recompute_values();
    }
    input_offset = -1;
}

if (async_load[? "id"] == input_length) {
    if (async_load[? "status"]) {
        try {
            the_array_length = real(async_load[? "result"]);
        }
        catch (ex) {}
        recompute_values();
    }
    input_length = -1;
}