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

load_file_uppercase = function() {
    var _filename = get_open_filename("JSON file|*.json|Any file|*.*", "");
    if (!is_string(_filename) && _filename == "")
        return;
    
    var _data = json_load(_filename, function(_key, _value) {
        return is_string(_value) ? string_upper(_value) : _value;
    });
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

save_file_uppercase = function() {
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
    
    json_save(_filename, _data, true, function(_key, _value) {
        return is_string(_value) ? string_upper(_value) : _value;
    });
}
