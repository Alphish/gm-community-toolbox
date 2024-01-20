/// @func ReferenceItemWriter()
/// @desc A base for reference items file writing tools.
function ReferenceItemWriter() constructor {
    var _docs_path = GM_project_filename;
    reference_path = file_path_resolve(
        file_path_append(_docs_path, "..", "..", "Docs", "Reference")
    );
    
    content = buffer_create(1024, buffer_grow, 1);
    
    static write_item = function(_item) {
        throw $"{instanceof(self)}.write_item(...) is not implemented.";
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
    
    // ------------
    // Item writing
    // ------------
    
    static write_breadcrumbs = function(_item) {
        write_crumb_segment(_item, true);
        write_line();
    }
    
    static write_crumb_segment = function(_item, _is_last) {
        if (is_undefined(_item.parent))
            write(link("Home", "/"));
        else
            write_crumb_segment(_item.parent, false);
        
        if (!_is_last) {
            write(" > ");
            write(link(_item.title, "/Docs/Reference/" + _item.get_page_path()));
        }
    }
    
    static write_title = function(_title) {
        write_line();
        write_line($"# {_title}");
    }
    
    static write_source_link = function(_path) {
        write_line();
        write_line(link("Go to source", _path));
    }
    
    static write_summary = function(_summary) {
        if (is_undefined(_summary))
            return;
        
        write_line();
        write_line(string_trim(_summary));
    }
    
    static write_sections = function(_sections) {
        array_foreach(_sections, function(_section) {
            write_line();
            write_line($"### {_section.title}");
            
            write_line();
            write_line(string_trim(_section.content));
        });
    }
    
    // ------
    // Saving
    // ------
    
    static save_content = function(_filename) {
        var _size = buffer_tell(content);
        buffer_resize(content, _size);
        buffer_save(content, file_path_append(reference_path, _filename));
    }
}