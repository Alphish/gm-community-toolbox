/// @func ReferenceHomeSubparser(parser)
/// @desc A tool for reading reference home information from the reference stub.
/// @arg {Struct.ReferenceItemStubsParser} parser       The main reference items parser.
function ReferenceHomeSubparser(_parser) : ReferenceItemSubparser(_parser) constructor {
    static read_item = function() {
        var _title = items_scanner.read_tag_line();
        var _summary = items_scanner.read_content();
        
        if (is_undefined(_title)) {
            fail($"The home reference item must define a title in a format '@home [title]'.");
            return undefined;
        }
        
        var _sections = read_sections_sequence();
        return new ReferenceHomeStub(_title, _summary, _sections);
    }
}
