/// @func json_load(filename)
/// @desc Loads a given JSON file into a GML value (struct/array/string/real).
/// @arg {String} filename      The path of the JSON file to load.
function json_load(_filename) {
    var _json_content = file_read_all_text(_filename);
    if (is_undefined(_json_content))
        return undefined;
    
    try {
        return json_parse(_json_content);
    } catch (_) {
        // if the file content isn't a valid JSON, prevent crash and return undefined instead
        return undefined;
    }
}

/// @func json_save(filename,value,[prettyprint])
/// @desc Saves a given GML value (struct/array/string/real) into a JSON file.
/// @arg {String} filename      The path of the JSON file to save.
/// @arg {Any} value            The value to save as a JSON file.
/// @arg {Bool} [prettyprint]   Whether to include indentations and newlines for readability (false by default).
function json_save(_filename, _value, _prettyprint = false) {
    var _json_content = json_stringify(_value, _prettyprint);
    file_write_all_text(_filename, _json_content);
}
