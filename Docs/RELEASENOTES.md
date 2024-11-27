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
    - [array_push_ext](Reference/Functions/array_push_ext.md) - Created a function to push items from an array to another array.
    - [array_insert_ext](Reference/Functions/array_insert_ext.md) - Created a function to insert items from an array into another array.
- **DS List utilities**
    - [ds_list_create_from_array](Reference/Functions/ds_list_create_from_array.md) - Created a function to create a DS list from an array.
    - [ds_list_add_from_array](Reference/Functions/ds_list_add_from_array.md) - Created a function to add items to a DS list from an array.
    - [ds_list_to_array](Reference/Functions/ds_list_to_array.md) - Created a function to create an array from a DS list.
    - [ds_list_add_to_array](Reference/Functions/ds_list_add_to_array.md) - Created a function to add items to an array from a DS list.
- **JSON utilities**
    - [json_load](Reference/Functions/json_load.md) - Added the `filter` and `raw` parameters to additionally process parsed values.
    - [json_save](Reference/Functions/json_save.md) - Added the `filter` parameter to preprocess values before stringifying.
- **Collision utilities**
    - [instance_position_top](Reference/Functions/instance_position_top.md) - Created a function to find the least-depth instance at the given position.
    - [instance_position_array](Reference/Functions/instance_position_array.md) - Created a function to populate an array with instances at the given position.
    - [instance_place_array](Reference/Functions/instance_place_array.md) - Created a function to populate an array with instances colliding with the caller's mask at the given position.
    - [collision_point_array](Reference/Functions/collision_point_array.md) - Created a function to populate an array with instances colliding with the given point.
    - [collision_circle_array](Reference/Functions/collision_circle_array.md) - Created a function to populate an array with instances colliding with the given circle.
    - [collision_line_array](Reference/Functions/collision_line_array.md) - Created a function to populate an array with instances colliding with the given line.
    - [collision_rectangle_array](Reference/Functions/collision_rectangle_array.md) - Created a function to populate an array with instances colliding with the given rectangle.
    - [collision_ellipse_array](Reference/Functions/collision_ellipse_array.md) - Created a function to populate an array with instances colliding with the given ellipse.
- **Drawing utilities: Settings**
    - [draw_set_color_alpha](Reference/Functions/draw_set_color_alpha.md) - Created a function to set color and alpha at once.
    - [draw_set_align](Reference/Functions/draw_set_align.md) - Created a function to set horizontal and vertical text align at once.
- **Drawing utilities: Shapes**
    - [draw_arc](Reference/Functions/draw_arc.md) - Created a function to draw an arc line.
    - [draw_circle_sector](Reference/Functions/draw_circle_sector.md) - Created a function to draw a circle sector shape (i.e. a pie slice).
    - [draw_circle_segment](Reference/Functions/draw_circle_segment.md) - Created a function to draw a circle segment shape (i.e. a bow).
    - [draw_ring](Reference/Functions/draw_ring.md) - Created a function to draw a ring shape.
    - [draw_ring_arc](Reference/Functions/draw_ring_arc.md) - Created a function to draw a ring slice shape.
- **Other utilities: Static initialization**
    - [static_init](Reference/Functions/static_init.md) - Created a function to initialize static variables of other functions.
    - [static_init_in_progress](Reference/Functions/static_init_in_progress.md) - Created a function to check if static variables initialization is in progress, in order to skip the non-static logic.

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
- **Other utilities: Nullish checks**
    - [is_nullish](Reference/Functions/is_nullish.md) - Created a function to check if the given value is nullish.
    - [is_defined](Reference/Functions/is_defined.md) - Created a function to check if the given value is defined (not nullish).
