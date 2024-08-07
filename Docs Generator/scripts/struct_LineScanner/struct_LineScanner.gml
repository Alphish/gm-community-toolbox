/// @func LineScanner(lines)
/// @desc A base for tools processing file contents line by line.
/// @arg {Array<String> lines       The file lines to process.
function LineScanner(_lines) constructor {
    lines = _lines;
    lines_count = array_length(lines);
    current_index = 0;
    current_line = lines[current_index];
    
    static get_line_number = function() {
        return current_index + 1; // editors have 1-indexed line numbering, hence +1
    }
    
    static is_at_end = function() {
        return current_index >= lines_count;
    }
    
    static advance = function() {
        current_index++;
        current_line = current_index < lines_count ? lines[current_index] : "";
    }
    
    static skip_empty_lines = function() {
        while (!is_at_end() && string_trim(current_line) == "") {
            advance();
        }
    }
}
