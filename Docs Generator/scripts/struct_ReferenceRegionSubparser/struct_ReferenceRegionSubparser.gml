/// @func ReferenceRegionSubparser(parser)
/// @desc A tool for reading region information from the reference stub.
/// @arg {Struct.ReferenceItemStubsParser} parser       The main reference items parser.
function ReferenceRegionSubparser(_parser) : ReferenceItemSubparser(_parser) constructor {
    static read_item = function() {
        var _keyname = items_scanner.get_keyname();
        var _title = items_scanner.get_title();
        items_scanner.advance();
        
        var _summary = items_scanner.read_content();
        
        if (is_undefined(_keyname) || !string_contains(_keyname, ":") || is_undefined(_title)) {
            fail($"The region reference item must define an identifier and title in a format '@region <[script]:[region]> [title]'.");
            return undefined;
        }
        
        var _sections = read_sections_sequence();
        return new ReferenceRegionStub(_keyname, _title, _summary, _sections);
    }
}
