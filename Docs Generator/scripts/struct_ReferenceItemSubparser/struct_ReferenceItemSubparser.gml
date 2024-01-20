/// @func ReferenceItemSubparser(parser)
/// @desc A base for reference page subparsers, processing specific types of reference items.
/// @arg {Struct.ReferenceItemStubsParser} parser       The main reference items parser.
function ReferenceItemSubparser(_parser) constructor {
    items_parser = _parser;
    items_scanner = _parser.items_scanner;
    
    static fail = function(_message) {
        items_parser.fail(_message);
    }
    
    static read_section = function() {
        var _title = items_scanner.read_tag_line();
        if (is_undefined(_title)) {
            fail($"A section has no title.");
            return undefined;
        }
        
        var _content = items_scanner.read_content();
        if (is_undefined(_content)) {
            fail($"A section has no content.");
            return undefined;
        }
        
        return new ReferenceSection(_title, _content);
    }
    
    static read_sections_sequence = function() {
        var _result = [];
        
        while (items_scanner.get_tag() == "section") {
            var _section = read_section();
            if (!is_undefined(_section))
                array_push(_result, _section);
        }
        
        return _result;
    }
}