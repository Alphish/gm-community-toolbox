/// @func ReferenceRegionWriter()
/// @desc A tool for writing regions reference pages.
function ReferenceRegionWriter() : ReferenceItemWriter() constructor {
    static write_item = function(_region) {
        write_breadcrumbs(_region);
        
        write_title(_region.title);
        write_source_link(_region.get_source_path())
        write_summary(_region.summary);
        write_functions(_region);
        write_sections(_region.sections);
        
        save_content(_region.get_page_path());
    }
    
    static write_functions = function(_region) {
        write_line();
        write_line("### Defined functions");
        
        write_line();
        write_functions_subtree(_region);
    }
    
    static write_functions_subtree = function(_item, _indent = "") {
        var _children_count = array_length(_item.children);
        for (var i = 0; i < _children_count; i++) {
            var _child = _item.children[i];
            write_line($"{_indent}- {link(_child.title, "/Docs/Reference/" + _child.get_page_path())}");
            write_functions_subtree(_child, "    " + _indent);
        }
    }
}
