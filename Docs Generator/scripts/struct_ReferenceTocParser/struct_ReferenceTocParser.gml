/// @func ReferenceTocParser(path,items)
/// @desc A tool for parsing the reference table of contents information.
/// @arg {String} path                                  The path to the table of contents data file.
/// @arg {Array<Struct.ReferenceItemStub>} items        The reference item stubs to match with corresponding table of contents entries.
function ReferenceTocParser(_path, _items) : MultiStepProcess() constructor {
    toc_lines = file_read_all_lines(_path);
    toc_scanner = new ReferenceTocScanner(toc_lines);
    
    items = _items;
    items_by_key = array_key_by(items, function(_item) { return _item.keyname; });
    toc_keyset = { "home": "home" };
    
    // setup of the home node, i.e. the reference root
    
    var _home_stub = items_by_key[$ "home"];
    if (is_undefined(_home_stub)) {
        fail($"There is no reference item defined with 'home' key.");
    }
    
    result = new ReferenceTocNode("home", "home", "Reference.md", _home_stub);
    current_node = result;
    current_indent = -1;
    parent_nodes = [];
    parent_indents = [];
    
    // ----------
    // Processing
    // ----------
    
    static perform_step = function() {
        toc_scanner.skip_empty_lines();
        if (toc_scanner.is_at_end()) {
            check_all_items_in_toc();
            return true;
        }
        
        process_toc_line();
        return false;
    }
    
    static process_toc_line = function() {
        var _line_data = toc_scanner.read_line_data();
        if (!validate_line_data(_line_data))
            return;
        
        var _node = prepare_new_node(_line_data);
        pop_to_indent(_line_data.indent);
        push_new_node(_node, _line_data.indent);
    }
    
    static validate_line_data = function(_line_data) {
        static allowed_types = ["script", "region", "func"];
        
        if (is_undefined(_line_data.keyname) || is_undefined(_line_data.type)) {
            fail($"Could not properly read the line '{_line_data.content}'.");
            return false;
        }
        
        if (!array_contains(allowed_types, _line_data.type)) {
            fail($"Received TOC entry type '{_line_data.type}'. TOC entry type must be one of the following: {string_join_ext(", ", allowed_types)}.");
            return false;
        }
        
        var _keyname = string_lower(_line_data.keyname);
        if (is_undefined(items_by_key[$ _keyname])) {
            fail($"There is no reference item defined with '{_keyname}' key.");
            return false;
        }
        
        var _item_type = items_by_key[$ _keyname].type;
        if (_item_type != _line_data.type) {
            fail($"Mismatch between reference item stub and TOC entry for '{_keyname}': The item stub has '{_item_type}' type while TOC entry has '{_line_data.type}' type.");
            return false;
        }
        
        if (!is_undefined(toc_keyset[$ _keyname])) {
            fail($"There is a duplicate table of contents entry with '{_keyname}' key.");
            return false;
        }
        
        return true;
    }
    
    static prepare_new_node = function(_line_data) {
        var _keyname = string_lower(_line_data.keyname);
        toc_keyset[$ _keyname] = _keyname;
        
        var _type = string_lower(_line_data.type);
        var _filename = _line_data.filename ?? _line_data.keyname;
        var _stub = items_by_key[$ _keyname];
        
        return new ReferenceTocNode(_type, _keyname, _filename, _stub);
    }
    
    static pop_to_indent = function(_indent) {
        while (_indent <= current_indent) {
            current_node = array_pop(parent_nodes);
            current_indent = array_pop(parent_indents);
        }
    }
    
    static push_new_node = function(_node, _indent) {
        array_push(current_node.children, _node);
        _node.parent = current_node;
        
        array_push(parent_nodes, current_node);
        array_push(parent_indents, current_indent);
        current_node = _node;
        current_indent = _indent;
    }
    
    static check_all_items_in_toc = function() {
        array_foreach(items, function(_item) {
            var _key = _item.keyname;
            if (is_undefined(toc_keyset[$ _key])) {
                fail($"There is no Table of Contents entry defined with '{_key}' key.");
            }
        });
    }
    
    // --------
    // Warnings
    // --------
    
    static get_warning_header = function() {
        var _line = toc_scanner.get_line_number();
        return $"Table of Contents at line {_line}";
    }
}
