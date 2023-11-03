image_index = 0;
image_speed = 0;

toolbox_path = "";

load_toolbox_project = function() {
    var _selected_path = get_open_filename("GM project|*.yyp", "Community Toolbox.yyp");
    if (_selected_path == "")
        return;
    
    toolbox_path = _selected_path;
}
