/// @func file_read_all_text(filename)
/// @desc Reads entire content of a given file as a string, or returns undefined if the file doesn't exist.
/// @arg {String} filename          The path of the file to read the content of.
/// @returns {Undefined,String}
function file_read_all_text(_filename) {
    var _buffer = buffer_load(_filename);
    if (!buffer_exists(_buffer))
        return undefined;
    
    if (buffer_get_size(_buffer) == 0)
        return "";
    
    var _result = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    return _result;
}

/// @func file_read_all_lines(filename)
/// @desc Reads entire content of a given file as an array of lines, or returns undefined if the file doesn't exist.
/// @arg {String} filename          The path of the file to read the content of.
/// @returns {Undefined,Array<String>}
function file_read_all_lines(_filename) {
    var _result = file_read_all_text(_filename);
    if (is_undefined(_result))
        return undefined;
    
    return string_split_ext(_result, ["\r\n", "\r", "\n"]);
}

/// @func file_find_array(dir,mask,attr)
/// @desc Searches a given directory for files matching the given pattern and attributes and returns an array of found files paths.
/// @arg {String} dir                       The directory to search the files in.
/// @arg {String} mask                      The mask of the files to find.
/// @arg {Constant.FileAttribute} attr      The file attributes to match.
/// @returns {Array<String>}
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

/// @func file_find_single(dir,mask,attr)
/// @desc Searches a given directory for a file matching the given pattern and attributes and returns its path. If none or multiple files were found, throws an error.
/// @arg {String} dir                       The directory to search the file in.
/// @arg {String} mask                      The mask of the file to find.
/// @arg {Constant.FileAttribute} attr      The file attributes to match.
/// @returns {String}
function file_find_single(_dir, _mask, _attr) {
    var _results = file_find_array(_dir, _mask, _attr);
    if (array_length(_results) == 0)
        throw $"No file matching {_mask} found in {_dir}.";
    
    if (array_length(_results) > 1)
        throw $"Multiple files matching {_mask} found in {_dir}.";
    
    return _results[0];
}
