// File management methods

// not using async methods, because there are no async methods for filenames getting

load_file = function() {
    var _filename = get_open_filename("JSON file|*.json|Any file|*.*", "");
    if (!is_string(_filename) && _filename == "")
        return;
    
    var _data = json_load(_filename);
    if (!is_undefined(_data))
        ui_JsonFileText.text = json_stringify(_data, true);
}

save_file = function() {
    var _filename = get_save_filename("JSON file|*.json|Any file|*.*", "");
    if (!is_string(_filename) && _filename == "")
        return;
    
    var _data;
    try {
        _data = json_parse(ui_JsonFileText.text);
    } catch (_ex) {
        show_message_async("Error: Cannot save invalid JSON.");
        return;
    }
    
    json_save(_filename, _data);
}

save_file_pretty = function() {
    var _filename = get_save_filename("JSON file|*.json|Any file|*.*", "");
    if (!is_string(_filename) && _filename == "")
        return;
    
    var _data;
    try {
        _data = json_parse(ui_JsonFileText.text);
    } catch (_ex) {
        show_message_async("Error: Cannot save invalid JSON.");
        return;
    }
    
    json_save(_filename, _data, true);
}

// Creating UI controls

instance_create_layer(32, 32, layer, ui_Button, {
    text: "Load file",
    on_click: load_file,
    image_xscale: 6,
});

instance_create_layer(32, 96, layer, ui_Button, {
    text: "Save file",
    on_click: save_file,
    image_xscale: 6,
});

instance_create_layer(32, 160, layer, ui_Button, {
    text: "Save file (pretty)",
    on_click: save_file_pretty,
    image_xscale: 6,
});
