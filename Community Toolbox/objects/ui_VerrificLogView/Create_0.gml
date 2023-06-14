// singleton enforcement
// if someone tries to work around the limitation
// by using instance_change without "perform events" flag
// I'm going to harm them with some blunt tool
if (instance_number(object_index) > 1)
    throw $"There can only be one instance of {object_get_name(object_index)} at a time.";

// import the main controller lines for convenience
lines = ctrl_VerrificLog.lines;

// log view styling/interactions
line_height = 24;
wheel_speed = line_height;
arrow_speed = line_height div 4;
page_speed = display_get_gui_height();

odd_background = #121212;
even_background = #171717;
none_background = #0c0c0c;

info_color = #c0c0c0;
status_colors = [
    #808080 /* found */,
    #c0c0c0 /* pending */,
    #c0c0c0 /* running */,
    #20b020 /* passed */,
    #40a0e0 /* unsure */,
    #a060ff /* unproven */,
    #ff7040 /* failed */,
    #ff4040 /* crashed */,
];

left_margin = 8;
indent_width = 20;
text_font = fnt_VerrificLogLine;

scroll_offset = 0;
total_height = display_get_gui_height();

// helper function to scroll to bottom
// when new messages are being added
scroll_to_bottom = function() {
    var _gui_height = display_get_gui_height();
    var _lines_count = array_length(lines);
    total_height = max(_gui_height, line_height * _lines_count);
    scroll_offset = total_height - _gui_height;
}
