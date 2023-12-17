/// @func ToolboxScriptScanner(lines)
/// @desc A tool for scanning a Toolbox GML script, line by line.
/// @arg {Array<String>} lines      The lines of the script to process.
function ToolboxScriptScanner(_lines) constructor {
    lines = _lines;
    lines_count = array_length(lines);
    current_index = 0;
    current_line = lines[current_index];
    
    static get_line_number = function() {
        return current_index + 1; // GitHub has 1-indexed line numbering, hence +1
    }
    
    static is_at_end = function() {
        return current_index >= lines_count;
    }
    
    static advance = function() {
        current_index++;
        current_line = current_index < lines_count ? lines[current_index] : "";
    }
    
    static skip_empty_lines = function() {
        while (!is_at_end() && string_trim(current_line) == "")
            advance();
    }
    
    static peeks_prefix = function(_prefix) {
        return string_starts_with(current_line, _prefix);
    }
    
    static read_line_after_prefix = function(_prefix) {
        if (!string_starts_with(current_line, _prefix))
            throw $"Attempting to read prefix '{_prefix}' but found mismatched line '{current_line}' instead.";
        
        var _unprefixed_line = string_delete(current_line, 1, string_length(_prefix));
        advance();
        return string_trim(_unprefixed_line);
    }
}
