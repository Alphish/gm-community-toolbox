/// @func ReferenceItemStubsExplorer(path)
/// @desc A tool for finding and processing reference stubs pages found in the Docs Generator files.
/// @arg {String} path      The path to the reference stubs files directory.
function ReferenceItemStubsExplorer(_path) : MultiStepProcess() constructor {
    // setup
    
    reference_files_path = string_replace_all(_path, "\\", "/");
    stub_paths = file_find_array(reference_files_path, "*.stub.md", fa_none);
    
    result = [];
    
    remaining_files = variable_clone(stub_paths);
    processed_count = 0;
    total_count = array_length(stub_paths);
    
    // processing
    
    static perform_step = function() {
        var _stub_path = array_shift(remaining_files);
        var _items_parser = new ReferenceItemStubsParser(_stub_path);
        _items_parser.run_to_end();
        
        if (!_items_parser.is_failed)
            array_copy(result, array_length(result), _items_parser.result, 0, array_length(_items_parser.result));
        else
            is_failed = true;
        
        processed_count++;
        if (processed_count < total_count)
            return false;
        
        if (is_failed)
            warn("Some reference items could not be parsed.");
        
        check_duplicates();
        
        return true;
    }
    
    static check_duplicates = function() {
        var _known_items = {};
        var _count = array_length(result);
        for (var i = 0; i < _count; i++) {
            var _item = result[i];
            var _duplicate = _known_items[$ _item.keyname];
            if (!is_undefined(_duplicate)) {
                fail($"Duplicate reference items found: {_duplicate.get_identification()} and {_item.get_identification()}");
                continue;
            }
            
            _known_items[$ _item.keyname] = _item;
        }
    }
    
    static get_warning_header = function() {
        return $"Problem with reference items stubs";
    }
}
