@region <Math:Euclidean division> Euclidean division

@func <eucdiv>

@section Example

The following code shows using Euclidean division to calculate placement on a 32x32 grid with negative coordinates.

```gml
place_cell_x = eucdiv(mouse_x, 32);
place_cell_y = eucdiv(mouse_y, 32);

place_x = 32 * place_cell_x;
place_y = 32 * place_cell_y;
```

@update 23.4.0
Created a function to calculate the quotient of an Euclidean division.

@func <eucmod>

@section Example

The following code shows using Euclidean division remainder to cycle through menu options. It properly handles negative selected index that occurs when the player pressed up arrow key starting from selected index of 0.

```gml
if (keyboard_check_pressed(vk_up))
    selected_index -= 1;

if (keyboard_check_pressed(vk_down))
    selected_index += 1;

selected_index = eucmod(selected_index, options_count);
```

@update 23.4.0
Created a function to calculate the remainder of an Euclidean division.
