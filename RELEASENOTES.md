23.4.0
======

This release is compatible with GameMaker 2023.4 version. You can download the YYMPS local package [here](https://github.com/Alphish/gm-community-toolbox/blob/main/Releases/CommunityToolbox.23.4.0.yymps?raw=1).

- implemented `is_nullish` and `is_defined` for checking potentially empty values
- implemented `eucdiv` and `eucmod` for calculating quotient and remainder of Euclidean division (which handles negative values differently than `div`/`mod` operators
- implemented `lerp_angle` for approaching an angle by the given percentage amount, along the shortest arc
- implemented `approach` for approaching a value by the given fixed step
- implemented `approach_angle` for approaching an angle by the given fixed step, along the shortest arc
- implemented `unlerp` for performing inverse interpolation (i.e. finding the percentage amount of the given value in the given range)
- implemented `relerp` for mapping a value in one range to a corresponding value in another range
- implemented `string_to_char_array` for turning a string into an array of its character; processing such an array is more efficient than `string_char_at` calls, especially for longer strings
- implemented `array_max`, `array_min`, `array_mean`, `array_median` and `array_sum` for various calculations on arrays of numbers
- implemented `array_get_random` and `array_pop_random` for finding (get) and deleting (pop) random values from arrays
- implemented `file_read_all_text` and `file_write_all_text` for reading/writing file contents into/from GML strings
- implemented `json_load` and `json_save` for reading/writing JSON files into/from GML values (numbers, strings, bools, arrays, structs)
- implemented `shader_set_uniform_color` for passing an RGBA colour vector to a shader
