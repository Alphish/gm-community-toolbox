/// @func ReferenceHomeWriter()
/// @desc A tool for writing the main reference page.
function ReferenceHomeWriter() : ReferenceItemWriter() constructor {
    static write_item = function(_home) {
        write_breadcrumbs(_home);
        
        write_title(_home.title);
        write_summary(_home.summary);
        write_toc(_home);
        write_functions_list(_home);
        write_sections(_home.sections);
        
        save_content(_home.get_page_path());
    }
    
    static write_toc = function(_home) {
        write_line();
        write_line("### Table of contents");
        
        write_line();
        write_toc_subtree(_home);
    }
    
    static write_toc_subtree = function(_item, _indent = "") {
        var _children_count = array_length(_item.children);
        for (var i = 0; i < _children_count; i++) {
            var _child = _item.children[i];
            if (is_instanceof(_child, ReferenceFunction))
                continue;
            
            write_line($"{_indent}- {link(_child.title, "/Docs/Reference/" + _child.get_page_path())}");
            write_toc_subtree(_child, "    " + _indent);
        }
    }
    
    static write_functions_list = function(_home) {
        write_line();
        write_line("### Functions list");
        
        write_line();
        var _all_items = _home.list_subtree();
        var _functions = array_filter(_all_items, function(_item) { return is_instanceof(_item, ReferenceFunction); });
        
        array_sort(_functions, function(_left, _right) {
            return _left.project_function.name < _right.project_function.name ? -1 : 1;
        });
        
        array_foreach(_functions, function(_function) {
            write_line($"- {link(_function.title, "/Docs/Reference/" + _function.get_page_path())}");
        });
    }
}
