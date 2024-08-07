/// @func ReferenceScriptWriter()
/// @desc A tool for writing scripts reference pages.
function ReferenceScriptWriter() : ReferenceItemWriter() constructor {
    static write_file = function(_script) {
        write_breadcrumbs(_script);
        
        write_title(_script.title);
        write_source_link(_script.get_script_path());
        write_summary(_script.summary);
        write_functions(_script)
        write_sections(_script.sections);
        
        save_content(_script.get_page_path());
    }
    
    static write_functions = function(_script) {
        write_section_header("Defined functions");
        write_line();
        write_functions_subtree(_script);
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
