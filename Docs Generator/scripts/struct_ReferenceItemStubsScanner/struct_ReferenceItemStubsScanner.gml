/// @func ReferenceItemStubsScanner(lines)
/// @desc A tool for scanning a reference stubs page, line by line.
/// @arg {Array<String>} lines      The lines of the reference stubs page to process.
function ReferenceItemStubsScanner(_lines) : LineScanner(_lines) constructor {
    static skip_to_tag = function() {
        while (!is_at_end() && !peeks_tag())
            advance();
    }
    
    static peeks_tag = function() {
        return string_starts_with(current_line, "@");
    }
    
    static get_tag = function() {
        var _tag = string_between(current_line, "@", " ") ?? string_delete(current_line, 1, 1);
        return string_lower(_tag);
    }
    
    static get_tag_line = function() {
        var _line = string_after(current_line, " ");
        if (is_undefined(_line))
            return undefined;
        
        _line = string_trim(_line);
        if (_line == "")
            return undefined;
        
        return _line;
    }
    
    static get_keyname = function() {
        var _keyname = string_lower(keyname_of(string_between(current_line, "<", ">")));
        return _keyname != "" ? _keyname : undefined;
    }
    
    static get_title = function() {
        var _title = string_trim(string_after(current_line, ">"));
        return _title != "" ? _title : undefined;
    }
    
    static read_tag_line = function() {
        var _result = get_tag_line();
        advance();
        return _result;
    }
    
    static read_content = function() {
        skip_empty_lines();
        
        if (is_at_end() || peeks_tag())
            return undefined;
        
        var _startpos = current_index;
        var _endpos = current_index;
        while (!is_at_end() && !peeks_tag()) {
            var _check_line = current_line;
            advance();
            if (string_trim(_check_line) == "")
                continue;
            
            _endpos = current_index;
        }
        
        var _adjusted_lines = array_map(lines, function(_line) {
            return string_starts_with(_line, "\\") ? string_delete(_line, 1, 1) : _line;
        }, _startpos, (_endpos + 1) - _startpos);
        return string_join_ext("\r\n", _adjusted_lines);
    }
}
