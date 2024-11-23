draw_function = undefined;
cx = room_width div 2 + 240;
cy = room_height div 2;

radius1 = 200;
radius2 = 100;
radius_range = array_create_ext(17, function(i) { return 25 * i; });

angle1 = 15;
angle2 = 165;
angle_range = array_create_ext(145, function(i) { return 5 * i - 360; });

precision = 24;
precision_range = array_create_ext(15, function(i) { return 4 * (i + 1); });

outline = true;

demo_draw_arc = function() {
    draw_arc(cx, cy, radius1, angle1, angle2, precision);
}

demo_draw_circle_sector = function() {
    draw_circle_sector(cx, cy, radius1, angle1, angle2, outline, precision);
}

demo_draw_circle_segment = function() {
    draw_circle_segment(cx, cy, radius1, angle1, angle2, outline, precision);
}

demo_draw_ring = function() {
    draw_ring(cx, cy, radius1, radius2, outline, precision);
}

demo_draw_ring_arc = function() {
    draw_ring_arc(cx, cy, radius1, radius2, angle1, angle2, outline, precision);
}

draw_function = demo_draw_arc;