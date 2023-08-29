/// @function json_load(filename)
/// @description Loads a given JSON file into a GML value (struct/array/string/real).
/// @param {String} filename        The path of the JSON file to load.
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

/// @function json_save(filename,value,[prettyprint])
/// @description Saves a given GML value (struct/array/string/real) into a JSON file.
/// @param {String} filename The path of the JSON file to save.
/// @param {Any} value The value to save as a JSON file.
/// @param {Bool} prettyprint Whether to include indentations and newlines for readability. (default: false)
function json_save(_filename, _value, _prettyprint=false) {
    var _json_content = json_stringify(_value, _prettyprint);
    file_write_all_text(_filename, _json_content);
}
