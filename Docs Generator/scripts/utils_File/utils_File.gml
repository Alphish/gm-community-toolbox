function file_read_all_text(_filename) {
    var _buffer = buffer_load(_filename);
    if (!buffer_exists(_buffer))
        return undefined;
    
    if (buffer_get_size(_buffer) == 0)
        return "";
    
    var _result = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    return _result;
}

function file_find_array(_dir, _mask, _attr) {
    var _result = [];
    var _next_entry = file_find_first(_dir + "/" + _mask, _attr);
    while (_next_entry != "") {
        array_push(_result, _dir + "/" + _next_entry);
        _next_entry = file_find_next();
    }
    file_find_close();
    return _result;
}

function file_find_single(_dir, _mask, _attr) {
    var _results = file_find_array(_dir, _mask, _attr);
    if (array_length(_results) == 0)
        throw $"No file matching {_mask} found in {_dir}.";
    
    if (array_length(_results) > 1)
        throw $"Multiple files matching {_mask} found in {_dir}.";
    
    return _results[0];
}
