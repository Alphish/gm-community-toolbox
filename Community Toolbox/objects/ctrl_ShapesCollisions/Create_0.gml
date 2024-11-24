point_x = 600;
point_y = 100;

circle_x = 200;
circle_y = 600;
circle_radius = 100;

line_x1 = 0;
line_y1 = 0;
line_x2 = 0.8 * room_width;
line_y2 = room_height;

rectangle_x1 = lerp(line_x1, line_x2, 0.1);
rectangle_y1 = lerp(line_y1, line_y2, 0.1);
rectangle_x2 = lerp(line_x1, line_x2, 0.45);
rectangle_y2 = lerp(line_y1, line_y2, 0.45);

ellipse_x1 = lerp(line_x1, line_x2, 0.5);
ellipse_y1 = lerp(line_y1, line_y2, 0.5);
ellipse_x2 = lerp(line_x1, line_x2, 0.95);
ellipse_y2 = lerp(line_y1, line_y2, 0.95);

check_precise = true;

mouse_instances = [];
snake_instances = [];
point_instances = [];
circle_instances = [];
line_instances = [];
rectangle_instances = [];
ellipse_instances = [];

mouse_string = "";
snake_string = "";
point_string = "";
circle_string = "";
line_string = "";
rectangle_string = "";
ellipse_string = "";
total_string = "";

stringify_colliders = function(_array) {
    return "[" + string_join_ext("", array_map(_array, function(_collider) { return _collider.letter; })) + "]";
}
