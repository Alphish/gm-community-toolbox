#region Settings

/// @func draw_set_color_alpha(color,alpha)
/// @desc Sets the drawing color and alpha.
/// @arg {Constant.Color} color     The drawing color to set.
/// @arg {Real} alpha               The alpha to set (between 0 and 1).
function draw_set_color_alpha(_color, _alpha) {
    gml_pragma("forceinline");
    draw_set_color(_color);
    draw_set_alpha(_alpha);
}

/// @func draw_set_colour_alpha(colour,alpha)
/// @desc Sets the drawing colour and alpha.
/// @arg {Constant.Color} colour    The drawing colour to set.
/// @arg {Real} alpha               The alpha to set (between 0 and 1).
function draw_set_colour_alpha(_colour, _alpha) {
    gml_pragma("forceinline");
    draw_set_colour(_colour);
    draw_set_alpha(_alpha);
}

/// @func draw_set_align(halign,valign)
/// @desc Sets the horizontal and vertical alignment of the drawn text.
/// @arg {Constant.HAlign} halign       The horizontal alignment to set.
/// @arg {Constant.VAlign} valign       The vertical alignment to set.
function draw_set_align(_halign, _valign) {
    gml_pragma("forceinline");
    draw_set_halign(_halign);
    draw_set_valign(_valign);
}

#endregion

#region Shapes

/// @func draw_arc(x,y,radius,anglefrom,angleto,[precision])
/// @desc Draws a circular line around the given center, with the given radius and between given angles.
/// @arg {Real} x               The x coordinate of the arc center.
/// @arg {Real} y               The y coordinate of the arc center.
/// @arg {Real} radius          The radius of the arc around the center.
/// @arg {Real} anglefrom       The starting angle of the arc.
/// @arg {Real} angleto         The ending angle of the arc.
/// @arg {Real} [precision]     The precision of the circle the arc is a part of.
function draw_arc(_x, _y, _radius, _anglefrom, _angleto, _precision = 24) {
    // static functions    
    static get_segment_position = function(_angle, _segment_angle) {
        _angle = _angle - floor(_angle / _segment_angle) * _segment_angle;
        if (_angle == 0)
            return 0;
        
        var _yfrom = dsin(_angle);
        var _yto = dsin(_angle - _segment_angle);
        return _yfrom / (_yfrom - _yto);
    }
    
    static draw_circle_vertex = function(_x, _y, _radius, _angle) {
        draw_vertex(_x + lengthdir_x(_radius, _angle), _y + lengthdir_y(_radius, _angle));
    }
    
    static draw_midsegment_vertex = function(_x, _y, _radius, _angle1, _angle2, _amount) {
        if (_amount == 0) {
            draw_circle_vertex(_x, _y, _radius, _angle1);
            return;
        }
        
        var _x1 = _x + lengthdir_x(_radius, _angle1);
        var _y1 = _y + lengthdir_y(_radius, _angle1);
        var _x2 = _x + lengthdir_x(_radius, _angle2);
        var _y2 = _y + lengthdir_y(_radius, _angle2);
        draw_vertex(lerp(_x1, _x2, _amount), lerp(_y1, _y2, _amount));
    }
    
    static normalize_angles = function(_anglefrom, _angleto) {
        static result = [0, 0];
        
        result[0] = min(_anglefrom, _angleto);
        result[1] = max(_anglefrom, _angleto);
        
        if (result[0] + 360 < result[1]) {
            result[0] = 0;
            result[1] = 360;
        }
        
        return result;
    }
    
    static draw_arc_vertices = method(static_get(draw_arc), function(_x, _y, _radius, _anglefrom, _angleto, _precision, _close) {
        var _segment_angle = 360 / _precision;
        var _start_amount = get_segment_position(_anglefrom, _segment_angle);
        var _end_amount = get_segment_position(_angleto, _segment_angle);
        var _start_index = floor(_anglefrom / _segment_angle);
        var _end_index = floor(_angleto / _segment_angle);
        
        // starting vertex
        draw_midsegment_vertex(_x, _y, _radius, _start_index * _segment_angle, (_start_index + 1) * _segment_angle, _start_amount);
        
        // mid-to-end vertices
        for (var i = _start_index + 1; i <= _end_index; i++) {
            draw_circle_vertex(_x, _y, _radius, i * _segment_angle);
        }
        
        // end midsegment, if any
        if (_end_amount > 0)
            draw_midsegment_vertex(_x, _y, _radius, _end_index * _segment_angle, (_end_index + 1) * _segment_angle, _end_amount);
        
        // move back to starting vertex if needed
        if (_close)
            draw_midsegment_vertex(_x, _y, _radius, _start_index * _segment_angle, (_start_index + 1) * _segment_angle, _start_amount);
    });
    
    // normalise the angles for easier processing
    var _normangles = normalize_angles(_anglefrom, _angleto);
    _anglefrom = _normangles[0];
    _angleto = _normangles[1];
    if (_anglefrom == _angleto)
        return;
    
    // draw the actual arc
    draw_primitive_begin(pr_linestrip);
    draw_arc_vertices(_x, _y, _radius, _anglefrom, _angleto, _precision, false);
    draw_primitive_end();
}

/// @func draw_pie(x,y,radius,anglefrom,angleto,[outline],[precision])
/// @desc Draws a pie-like shape (i.e. a circle sector) around the given center, with the given radius and between given angles.
/// @arg {Real} x               The x coordinate of the pie center.
/// @arg {Real} y               The y coordinate of the pie center.
/// @arg {Real} radius          The radius of the pie around the center.
/// @arg {Real} anglefrom       The starting angle of the pie.
/// @arg {Real} angleto         The ending angle of the pie.
/// @arg {Bool} [outline]       Whether only the outline of the pie should be drawn or it should be filled.
/// @arg {Real} [precision]     The precision of the circle the pie's arc is a part of.
function draw_pie(_x, _y, _radius, _anglefrom, _angleto, _outline = false, _precision = 24) {
    // making the initial "draw_arc" call to prepare its static struct
    static draw_arc_init = draw_arc(0, 0, 0, 0, 0);
    static normalize_angles = draw_arc.normalize_angles;
    static draw_arc_vertices = draw_arc.draw_arc_vertices;
    
    // normalise the angles for easier processing
    var _normangles = normalize_angles(_anglefrom, _angleto);
    _anglefrom = _normangles[0];
    _angleto = _normangles[1];
    if (_anglefrom == _angleto)
        return;
    
    if (_outline && _angleto - _anglefrom >= 360) {
        draw_arc(_x, _y, _radius, 0, 360, _precision);
        return;
    }
    
    // draw the actual pie
    draw_primitive_begin(_outline ? pr_linestrip : pr_trianglefan);

    draw_vertex(_x, _y);
    draw_arc_vertices(_x, _y, _radius, _anglefrom, _angleto, _precision, false);
    if (_outline)
        draw_vertex(_x, _y);
    
    draw_primitive_end();
}

/// @func draw_chord(x,y,radius,anglefrom,angleto,[outline],[precision])
/// @desc Draws a chord-like shape (i.e. a circle segment) around the given center, with the given radius and between given angles.
/// @arg {Real} x               The x coordinate of the chord center.
/// @arg {Real} y               The y coordinate of the chord center.
/// @arg {Real} radius          The radius of the chord around the center.
/// @arg {Real} anglefrom       The starting angle of the chord.
/// @arg {Real} angleto         The ending angle of the chord.
/// @arg {Bool} [outline]       Whether only the outline of the chord should be drawn or it should be filled.
/// @arg {Real} [precision]     The precision of the circle the chord's arc is a part of.
function draw_chord(_x, _y, _radius, _anglefrom, _angleto, _outline = false, _precision = 24) {
    // making the initial "draw_arc" call to prepare its static struct
    static draw_arc_init = draw_arc(0, 0, 0, 0, 0);
    static normalize_angles = draw_arc.normalize_angles;
    static draw_arc_vertices = draw_arc.draw_arc_vertices;
    
    // normalise the angles for easier processing
    var _normangles = normalize_angles(_anglefrom, _angleto);
    _anglefrom = _normangles[0];
    _angleto = _normangles[1];
    if (_anglefrom == _angleto)
        return;
    
    // draw the actual circle segment
    draw_primitive_begin(_outline ? pr_linestrip : pr_trianglefan);
    draw_arc_vertices(_x, _y, _radius, _anglefrom, _angleto, _precision, _outline);
    draw_primitive_end();
}

/// @func draw_arc_range(x,y,radius,anglefrom,angleto,[outline],[precision])
/// @desc Draws a band-like shape between two arcs around the given center, with the given radii and between given angles.
/// @arg {Real} x               The x coordinate of the chord center.
/// @arg {Real} y               The y coordinate of the chord center.
/// @arg {Real} r1              The first radius to draw the band between.
/// @arg {Real} r2              The second radius to draw the band between.
/// @arg {Real} anglefrom       The starting angle of the arcs.
/// @arg {Real} angleto         The ending angle of the arcs.
/// @arg {Bool} [outline]       Whether only the outline of the band should be drawn or it should be filled.
/// @arg {Real} [precision]     The precision of the circles the band is drawn between.
function draw_arc_range(_x, _y, _r1, _r2, _anglefrom, _angleto, _outline = false, _precision = 24) {
    // making the initial "draw_arc" call to prepare its static struct
    static draw_arc_init = draw_arc(0, 0, 0, 0, 0);
    static normalize_angles = draw_arc.normalize_angles;
    
    static draw_arc_range_vertices = method(static_get(draw_arc), function(_x, _y, _r1, _r2, _anglefrom, _angleto, _precision, _outline) {
        var _segment_angle = 360 / _precision;
        var _start_amount = get_segment_position(_anglefrom, _segment_angle);
        var _end_amount = get_segment_position(_angleto, _segment_angle);
        var _start_index = floor(_anglefrom / _segment_angle);
        var _end_index = floor(_angleto / _segment_angle);
        
        // starting vertex
        draw_midsegment_vertex(_x, _y, _r1, _start_index * _segment_angle, (_start_index + 1) * _segment_angle, _start_amount);
        if (!_outline) {
            draw_midsegment_vertex(_x, _y, _r2, _start_index * _segment_angle, (_start_index + 1) * _segment_angle, _start_amount);
        }
        
        // mid-to-end vertices
        for (var i = _start_index + 1; i <= _end_index; i++) {
            draw_circle_vertex(_x, _y, _r1, i * _segment_angle);
            if (!_outline)
                draw_circle_vertex(_x, _y, _r2, i * _segment_angle);
        }
        
        // end midsegment, if any
        if (_end_amount > 0) {
            draw_midsegment_vertex(_x, _y, _r1, _end_index * _segment_angle, (_end_index + 1) * _segment_angle, _end_amount);
            draw_midsegment_vertex(_x, _y, _r2, _end_index * _segment_angle, (_end_index + 1) * _segment_angle, _end_amount);
        }
        
        if (_outline) {
            for (var i = _end_index; i >= _start_index + 1; i--) {
                draw_circle_vertex(_x, _y, _r2, i * _segment_angle);
            }
            draw_midsegment_vertex(_x, _y, _r2, _start_index * _segment_angle, (_start_index + 1) * _segment_angle, _start_amount);
            draw_midsegment_vertex(_x, _y, _r1, _start_index * _segment_angle, (_start_index + 1) * _segment_angle, _start_amount);
        }
    });
    
    // when the radii are equal, just draw a regular arc
    if (_r1 == _r2) {
        draw_arc(_x, _y, _r1, _anglefrom, _angleto, _precision);
        return;
    }
    
    // normalize the angles for easier processing
    var _normangles = normalize_angles(_anglefrom, _angleto);
    _anglefrom = _normangles[0];
    _angleto = _normangles[1];
    if (_anglefrom == _angleto)
        return;
    
    if (_outline && _angleto - _anglefrom >= 360) {
        draw_arc(_x, _y, _r1, 0, 360, _precision);
        draw_arc(_x, _y, _r2, 0, 360, _precision);
        return;
    }
    
    // draw the actual arc range
    draw_primitive_begin(_outline ? pr_linestrip : pr_trianglestrip);
    draw_arc_range_vertices(_x, _y, _r1, _r2, _anglefrom, _angleto, _precision, _outline);
    draw_primitive_end();
}

#endregion
