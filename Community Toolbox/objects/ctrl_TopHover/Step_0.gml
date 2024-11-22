with (obj_TopHoverable) {
    image_blend = merge_color(base_color, c_black, 0.5);
}

with (instance_position_top(mouse_x, mouse_y, obj_TopHoverable)) {
    image_blend = base_color;
}