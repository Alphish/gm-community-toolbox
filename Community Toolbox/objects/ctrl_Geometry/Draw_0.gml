if (xdiff != 0 && ydiff != 0) {
    draw_set_color(c_gray);
    var _factor = room_width / length;
    draw_line(origin_x, origin_y, origin_x + _factor * xdiff, origin_y + _factor * ydiff);
    
    draw_set_color(c_white);
    draw_line_width(origin_x, origin_y, origin_x + xdiff, origin_y + ydiff, 3);
}

draw_set_color(c_gray);
draw_line(origin_x, origin_y, origin_x + room_width, origin_y);

if (angle > 0)
    draw_arc(origin_x, origin_y, 64, 0, angle);
