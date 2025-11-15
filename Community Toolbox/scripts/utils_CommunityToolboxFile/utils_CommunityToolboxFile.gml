/// @func file_read_all_text(filename)
/// @url http://github.com/Alphish/gm-community-toolbox/blob/main/Docs/Reference/Functions/file_read_all_text.md
/// @desc Reads entire content of a given file as a string, or returns undefined if the file couldn't be read.
/// @arg {String} filename          The path of the file to read the content of.
/// @returns {Undefined,String}
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

/// @func file_write_all_text(filename,content)
/// @url http://github.com/Alphish/gm-community-toolbox/blob/main/Docs/Reference/Functions/file_write_all_text.md
/// @desc Creates or overwrites a given file with the given string content.
/// @arg {String} filename          The path of the file to create/overwrite.
/// @arg {String} content           The content to create/overwrite the file with.
function file_write_all_text(_filename, _content) {
    var _buffer = buffer_create(string_length(_content), buffer_grow, 1);
    buffer_write(_buffer, buffer_text, _content);
    buffer_save(_buffer, _filename);
    buffer_delete(_buffer);
}
