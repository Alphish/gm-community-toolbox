[Home](/README.md)

# Release notes
Below is the releases history, with detailed information about specific functions affected.

### 24.6.0

**Download:** [YYMPS](https://github.com/Alphish/gm-community-toolbox/releases/download/v24.6.0/CommunityToolbox.24.6.0.yymps)

- **String utilities**
    - [string_contains](Reference/Functions/string_contains.md) - Created a function to check whether a given string contains the given substring.
- **Array utilities: Basic operations**
    - [array_empty](Reference/Functions/array_empty.md) - Created a function to check if an array is empty.
    - [array_clear](Reference/Functions/array_clear.md) - Created a function to clear arrays.
- **DS List utilities**
    - [ds_list_create_from_array](Reference/Functions/ds_list_create_from_array.md) - Created a function to create a DS list from an array.
    - [ds_list_add_from_array](Reference/Functions/ds_list_add_from_array.md) - Created a function to add items to a DS list from an array.
    - [ds_list_to_array](Reference/Functions/ds_list_to_array.md) - Created a function to create an array from a DS list.
    - [ds_list_add_to_array](Reference/Functions/ds_list_add_to_array.md) - Created a function to add items to an array from a DS list.
- **JSON utilities**
    - [json_load](Reference/Functions/json_load.md) - Added the `filter` and `raw` parameters to additionally process parsed values.
    - [json_save](Reference/Functions/json_save.md) - Added the `filter` parameter to preprocess values before stringifying.

### 23.4.1

**Download:** [YYMPS](https://github.com/Alphish/gm-community-toolbox/releases/download/v23.4.1/CommunityToolbox.23.4.1.yymps)

- **Math utilities: Fixed step approach**
    - [approach_angle](Reference/Functions/approach_angle.md) - Tweaked the JSDocs.
- **String utilities**
    - [string_to_char_array](Reference/Functions/string_to_char_array.md) - Tweaked the JSDocs.
- **File utilities**
    - [file_read_all_text](Reference/Functions/file_read_all_text.md) - Tweaked the JSDocs.
- **JSON utilities**
    - [json_load](Reference/Functions/json_load.md) - Tweaked the JSDocs.
    - [json_save](Reference/Functions/json_save.md) - Tweaked the JSDocs.

### 23.4.0

**Download:** [YYMPS](https://github.com/Alphish/gm-community-toolbox/releases/download/v23.4.0/CommunityToolbox.23.4.0.yymps)

- **Math utilities: Euclidean division**
    - [eucdiv](Reference/Functions/eucdiv.md) - Created a function to calculate the quotient of an Euclidean division.
    - [eucmod](Reference/Functions/eucmod.md) - Created a function to calculate the remainder of an Euclidean division.
- **Math utilities: Fixed step approach**
    - [approach](Reference/Functions/approach.md) - Created a function to approach a given target value by a fixed step.
    - [approach_angle](Reference/Functions/approach_angle.md) - Created a function to approach a given angle by a fixed step.
- **Math utilities: Linear interpolation**
    - [lerp_angle](Reference/Functions/lerp_angle.md) - Created a function to approach a given angle by a given fraction.
    - [unlerp](Reference/Functions/unlerp.md) - Created a function to retrieve the interpolation amount for the given value and range.
    - [relerp](Reference/Functions/relerp.md) - Created a function to convert a value in one range to a corresponding value in another range.
- **String utilities**
    - [string_to_char_array](Reference/Functions/string_to_char_array.md) - Created a function to convert a string to an array of its characters.
- **Array utilities: Number array statistics**
    - [array_max](Reference/Functions/array_max.md) - Created a function to find the lowest value in a numbers array.
    - [array_min](Reference/Functions/array_min.md) - Created a function to find the greatest value in a numbers array.
    - [array_median](Reference/Functions/array_median.md) - Created a function to find the median value in a numbers array.
    - [array_mean](Reference/Functions/array_mean.md) - Created a function to calculate the average value of the numbers array values.
    - [array_sum](Reference/Functions/array_sum.md) - Created a function to calculate the sum of the numbers array values.
- **Array utilities: Retrieving random items**
    - [array_get_random](Reference/Functions/array_get_random.md) - Created a function to get a random value from an array.
    - [array_pop_random](Reference/Functions/array_pop_random.md) - Created a function to get and remove a random value from an array.
- **File utilities**
    - [file_read_all_text](Reference/Functions/file_read_all_text.md) - Created a function to read file contents as a string.
    - [file_write_all_text](Reference/Functions/file_write_all_text.md) - Created a function to replace file contents with a given string.
- **JSON utilities**
    - [json_load](Reference/Functions/json_load.md) - Created a function to read a JSON value from a file.
    - [json_save](Reference/Functions/json_save.md) - Created a function to write a given value to a JSON file.
- **Shader utilities**
    - [shader_set_uniform_color](Reference/Functions/shader_set_uniform_color.md) - Created a function to easily pass colour parameters into shaders.
- **Other utilities**
    - [is_nullish](Reference/Functions/is_nullish.md) - Created a function to check if the given value is nullish.
    - [is_defined](Reference/Functions/is_defined.md) - Created a function to check if the given value is defined (not nullish).
