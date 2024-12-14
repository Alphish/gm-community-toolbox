/// @func DocsFileWriter()
/// @desc A base for tools writing documentation files.
function DocsFileWriter() constructor {
    var _generator_path = GM_project_filename;
    root_path = file_path_resolve(
        file_path_append(_generator_path, "..", "..")
    );
    docs_path = file_path_resolve(
        file_path_append(_generator_path, "..", "..", "Docs")
    );
    base_path = docs_path;
    
    content = buffer_create(1024, buffer_grow, 1);
    
    static write_file = function(_item) {
        throw $"{instanceof(self)}.write_file(...) is not implemented.";
    }
    
    // -------------
    // Basic writing
    // -------------
    
    static write = function(_text) {
        buffer_write(content, buffer_text, _text);
    }
    
    static write_line = function(_line = "") {
        if (_line != "")
            write(_line);
        
        write("\r\n");
    }
    
    static write_title = function(_title) {
        write_line();
        write_line($"# {_title}");
    }
    
    static write_section_header = function(_title) {
        write_line();
        write_line($"### {_title}");
    }
    
    static write_row = function() {
        write("|");
        for (var i = 0; i < argument_count; i++) {
            write(" ");
            write(argument[i]);
            write(" |");
        }
        write("\r\n");
    }
    
    static write_row_alignment = function() {
        write("|");
        for (var i = 0; i < argument_count; i++) {
            switch (argument[i]) {
                case fa_left:
                    write(":---");
                    break;
                case fa_center:
                    write(":---:");
                    break;
                case fa_right:
                    write("---:");
                    break;
                default:
                    throw $"Expected text alignment, but got '{argument[i]}'.";
            }
            write("|");
        }
        write("\r\n");
    }
    
    static link = function(_label, _address) {
        return $"[{_label}]({_address})";
    }

    
    // ------
    // Saving
    // ------
    
    static save_content = function(_filename) {
        var _size = buffer_tell(content);
        buffer_resize(content, _size);
        buffer_save(content, file_path_append(base_path, _filename));
    }
}