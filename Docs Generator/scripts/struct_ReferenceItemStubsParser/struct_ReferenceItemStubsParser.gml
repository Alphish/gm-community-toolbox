/// @func ReferenceItemStubsParser(path)
/// @desc A tool for parsing reference item stubs information into memory.
/// @arg {String} path      The path to the file with reference item stubs.
function ReferenceItemStubsParser(_path) : MultiStepProcess() constructor {
    items_path = _path;
    items_filename = file_path_get_filename(items_path);
    
    items_lines = file_read_all_lines(items_path);
    items_scanner = new ReferenceItemStubsScanner(items_lines);
    items_subparsers = {
        "home": new ReferenceHomeSubparser(self),
        "script": new ReferenceScriptSubparser(self),
        "region": new ReferenceRegionSubparser(self),
        "func": new ReferenceFunctionSubparser(self),
    };
    
    result = [];
    
    static perform_step = function() {
        items_scanner.skip_to_tag();
        if (items_scanner.is_at_end())
            return true;
        
        var _stub = read_item_stub();
        if (!is_undefined(_stub))
            array_push(result, _stub);
        
        return false;
    }
    
    static read_item_stub = function() {
        var _tag = items_scanner.get_tag();
        var _subparser = items_subparsers[$ _tag];
        if (is_undefined(_subparser)) {
            fail($"Unknown reference item tag: '@{_tag}'.");
            return undefined;
        }
        
        var _item = _subparser.read_item();
        if (!is_undefined(_item))
            _item.source = items_filename;
        
        return _item;
    }
    
    static get_warning_header = function() {
        var _line = items_scanner.get_line_number();
        return $"Reference {items_filename} at line {_line}";
    }
}
