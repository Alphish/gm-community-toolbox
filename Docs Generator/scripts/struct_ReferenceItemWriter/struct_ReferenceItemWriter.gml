/// @func ReferenceItemWriter()
/// @desc A base for reference items file writing tools.
function ReferenceItemWriter() : DocsFileWriter() constructor {
    reference_path = file_path_append(docs_path, "Reference");
    base_path = reference_path;
    
    // ------------
    // Item writing
    // ------------
    
    static write_breadcrumbs = function(_item) {
        write_crumb_segment(_item, true);
        write_line();
    }
    
    static write_crumb_segment = function(_item, _is_last) {
        if (is_undefined(_item.parent))
            write(link("Home", "/README.md"));
        else
            write_crumb_segment(_item.parent, false);
        
        if (!_is_last) {
            write(" > ");
            write(link(_item.title, "/Docs/Reference/" + _item.get_page_path()));
        }
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
            write_section_header(_section.title);
            write_line();
            write_line(string_trim(_section.content));
        });
    }
}