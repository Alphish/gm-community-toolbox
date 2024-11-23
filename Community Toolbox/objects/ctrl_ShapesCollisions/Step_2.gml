instance_position_array(mouse_x, mouse_y, obj_CollisionChecker, mouse_instances, false, true);
with (obj_CollisionSnake) {
    instance_place_array(x, y, obj_CollisionChecker, other.snake_instances, false, true);
}

collision_point_array(point_x, point_y, obj_CollisionChecker, check_precise, false, point_instances, false, true);
collision_circle_array(circle_x, circle_y, circle_radius, obj_CollisionChecker, check_precise, false, circle_instances, false, true);
collision_line_array(line_x1, line_y1, line_x2, line_y2, obj_CollisionChecker, check_precise, false, line_instances, false, true);
collision_rectangle_array(rectangle_x1, rectangle_y1, rectangle_x2, rectangle_y2, obj_CollisionChecker, check_precise, false, rectangle_instances, false, true);
collision_ellipse_array(ellipse_x1, ellipse_y1, ellipse_x2, ellipse_y2, obj_CollisionChecker, check_precise, false, ellipse_instances, false, true);

mouse_string = stringify_colliders(mouse_instances);
snake_string = stringify_colliders(snake_instances);
point_string = stringify_colliders(point_instances);
circle_string = stringify_colliders(circle_instances);
line_string = stringify_colliders(line_instances);
rectangle_string = stringify_colliders(rectangle_instances);
ellipse_string = stringify_colliders(ellipse_instances);

total_string = $"MOUSE: {mouse_string}\nSNAKE: {snake_string}\nPOINT: {point_string}\nCIRCLE: {circle_string}\nLINE: {line_string}\nRECTANGLE: {rectangle_string}\nELLIPSE: {ellipse_string}";
