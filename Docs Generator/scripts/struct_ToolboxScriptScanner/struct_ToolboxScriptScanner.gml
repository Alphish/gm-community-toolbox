/// @func ToolboxScriptScanner(lines)
/// @desc A tool for scanning a Toolbox GML script, line by line.
/// @arg {Array<String>} lines      The lines of the script to process.
function ToolboxScriptScanner(_lines) : LineScanner(_lines) constructor {
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
