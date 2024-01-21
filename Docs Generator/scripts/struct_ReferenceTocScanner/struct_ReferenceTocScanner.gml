/// @func ReferenceTocScanner(lines)
/// @desc A tool for scanning a reference table of contents, line by line.
/// @arg {Array<String>} lines      The table of contents lines to process.
function ReferenceTocScanner(_lines) : LineScanner(_lines) constructor {
    static read_line_data = function() {
        var _indent = string_length(current_line) - string_length(string_trim_start(current_line));
        var _content = string_trim(current_line);
        advance();
        
        if (!string_starts_with(_content, "@"))
            return { indent: _indent, type: undefined, key: undefined, filename: undefined, content: _content };
        
        var _keyname = keyname_of(string_between(_content, "<", ">"));
        if (is_undefined(_keyname))
            return { indent: _indent, type: undefined, key: undefined, filename: undefined, content: _content };
        
        var _type = string_trim(string_between(_content, "@", "<"));
        if (_type == "")
            _type = undefined;
        
        var _filename = string_trim(string_after(_content, ">"));
        if (_filename == "")
            _filename = undefined;
        
        return { indent: _indent, type: _type, keyname: _keyname, filename: _filename, content: _content };
    }
}
