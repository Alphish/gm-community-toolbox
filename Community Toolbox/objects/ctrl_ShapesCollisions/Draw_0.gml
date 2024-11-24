draw_set_color_alpha(c_white, 1);
draw_rectangle(point_x - 5, point_y, point_x + 5, point_y, false);
draw_rectangle(point_x, point_y - 5, point_x, point_y + 5, false);

draw_set_color_alpha(c_yellow, 0.3);
draw_circle(circle_x, circle_y, circle_radius, false);

draw_set_color_alpha(c_aqua, 1);
draw_line(line_x1, line_y1, line_x2, line_y2);

draw_set_color_alpha(c_lime, 0.3);
draw_rectangle(rectangle_x1, rectangle_y1, rectangle_x2, rectangle_y2, false);

draw_set_color_alpha(c_blue, 0.3);
draw_ellipse(ellipse_x1, ellipse_y1, ellipse_x2, ellipse_y2, false);

draw_set_color_alpha(c_white, 1);
