@region <Drawing:Settings> Settings

@func <draw_set_color_alpha>

@section Example

The following code draws a yellow semi-transparent rectangle over a hovered button.

```gml
draw_self();
if (position_meeting(mouse_x, mouse_y, id)) {
    draw_set_color_alpha(c_yellow, 0.3);
    draw_rectangle(x, y, x + sprite_width, y + sprite_height, false);
    draw_set_color_alpha(c_white, 1);
}
```

@update 24.6.0
Created a function to set color and alpha at once.

@func <draw_set_align>

@section Example

The following code draws text in the middle of a button.

```gml
draw_self();
draw_set_color_alpha(c_yellow, 1);
draw_set_align(fa_center, fa_middle);
draw_set_font(fnt_Button);
draw_text(x + sprite_width div 2, y + sprite_height div 2, "Click me!");
```

@update 24.6.0
Created a function to set horizontal and vertical text align at once.
