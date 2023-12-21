#region File reading/writing

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

#endregion

#region File finding

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

#endregion

#region File path

/// @func file_path_get_directory(_path,[level])
/// @desc Gets a ancestor directory for the given file path up to the given nesting level (1 by default, i.e. parent directory). If no ancestor directory can be found, returns undefined.
/// @arg {String} path      The file path to get the directory of.
/// @arg {Real} level       The number of nesting levels to go up.
/// @returns {String,Undefined}
function file_path_get_directory(_path, _level = 1) {
    static directory_separators = ["/", "\\"];
    
    _path = string_trim_end(_path, directory_separators);
    repeat (_level) {
        var _foreslash_idx = string_last_pos("/", _path);
        var _backslash_idx = string_last_pos("\\", _path);
        var _separator_idx = max(_foreslash_idx, _backslash_idx);
        if (_separator_idx < 1)
            return undefined;
        
        _path = string_copy(_path, 1, _separator_idx - 1);
    }
    return _path;
}

/// @func file_path_resolve(path)
/// @desc Resolves a path with ".." directory-up segments into the proper destination path. May return undefined if going up the directory goes outside the base path.
/// @arg {String} path      The path to resolve.
/// @returns {String,Undefined}
function file_path_resolve(_path) {
    static directory_separators = ["/", "\\"];
    
    _path = string_trim_end(_path, directory_separators);
    
    var _segments = string_split_ext(_path, directory_separators, false);
    var _resolved_segments = array_create(array_length(_segments));
    var _resolved_length = 0;
    
    var _separator_pos = 1;
    for (var i = 0; i < array_length(_segments); i++) {
        var _segment = _segments[i];
        
        if (_segment == "") {
            _separator_pos++;
        } else if (_segment == "..") {
            _separator_pos += 3;
            _resolved_length--;
            if (_resolved_length < 0)
                return undefined;
        } else {
            _separator_pos += string_length(_segment);
            _segment += string_char_at(_path, _separator_pos);
            _separator_pos++;
            
            _resolved_segments[_resolved_length] = _segment;
            _resolved_length++;
        }
    }
    
    return string_join_ext("", _resolved_segments, 0, _resolved_length);
}

/// @func file_path_append(path,...segments)
/// @desc Appends one or more segments to the given file path.
/// @arg {String} path              The base path.
/// @arg {String} ...segments       The segments to add to the path.
/// @return {String}
function file_path_append(_path) {
    static directory_separators = ["/", "\\"];
    var _foreslash_idx = string_last_pos("/", _path);
    var _backslash_idx = string_last_pos("\\", _path);
    var _separator = _foreslash_idx >= _backslash_idx ? "/" : "\\";
    
    var _trimmed_segments = array_create(argument_count);
    _trimmed_segments[0] = string_trim_end(_path, directory_separators);
    for (var i = 1; i < argument_count; i++) {
        _trimmed_segments[i] = string_trim(argument[i], directory_separators);
    }
    return string_join_ext(_separator, _trimmed_segments);
}

#endregion
