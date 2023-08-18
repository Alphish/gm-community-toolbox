// File management methods

// not using async methods, because there are no async methods for filenames getting

load_file = function() {
    var _filename = get_open_filename("Text file|*.txt|Any file|*.*", "");
    if (!is_string(_filename) && _filename == "")
        return;
    
    var _text = file_read_all_text(_filename);
    if (is_string(_text))
        ui_FileText.text = _text;
}

save_file = function() {
    var _filename = get_save_filename("Text file|*.txt|Any file|*.*", "");
    if (!is_string(_filename) && _filename == "")
        return;
    
    file_write_all_text(_filename, ui_FileText.text);
}

// Creating UI controls

instance_create_layer(32, 32, layer, ui_Button, {
    text: "Load file", on_click: load_file, image_xscale: 6
});

instance_create_layer(32, 96, layer, ui_Button, {
    text: "Save file", on_click: save_file, image_xscale: 6
});
