/// @func ReferenceFunctionSubparser(parser)
/// @desc A tool for reading function information from the reference stub.
/// @arg {Struct.ReferenceItemStubsParser} parser       The main reference items parser.
function ReferenceFunctionSubparser(_parser) : ReferenceItemSubparser(_parser) constructor {
    static function_tags = ["arg", "returns", "section"];
    
    static read_item = function() {
        var _keyname = items_scanner.get_keyname();
        var _title = items_scanner.get_title();
        items_scanner.advance();
        
        var _summary = items_scanner.read_content();
        
        if (is_undefined(_keyname) || !is_undefined(_title)) {
            fail($"The function reference item must define an identifier in a format '@func <[function]>'.");
            skip_function_tags();
            return undefined;
        }
        
        var _arguments = [];
        var _returns = undefined;
        var _sections = [];
        
        var _tag = items_scanner.get_tag();
        while (array_contains(function_tags, _tag)) {
            switch (_tag) {
                case "arg":
                    var _argument = read_function_argument();
                    if (!is_undefined(_argument))
                        array_push(_arguments, _argument);
                    break;
                
                case "returns":
                    _returns = read_function_returns();
                    break;
                
                case "section":
                    var _section = read_section();
                    if (!is_undefined(_section))
                        array_push(_sections, _section);
                    break;
            }
            
            _tag = items_scanner.get_tag();
        }
        
        return new ReferenceFunctionStub(_keyname, _summary, _arguments, _returns, _sections);
    }
    
    static skip_function_tags = function() {
        var _tag = items_scanner.get_tag();
        while (array_contains(function_tags, _tag)) {
            items_scanner.advance();
            items_scanner.skip_to_tag();
            if (items_scanner.is_at_end())
                break;
            
            _tag = items_scanner.get_tag();
        }
    }
    
    static read_function_argument = function() {
        var _keyname = items_scanner.get_keyname();
        var _usage = items_scanner.get_title();
        items_scanner.advance();
        
        var _description = items_scanner.read_content();
        
        if (is_undefined(_keyname)) {
            fail($"No argument name was provided in the @arg tag.");
            return undefined;
        }
        
        return new ReferenceArgumentStub(_keyname, _usage, _description);
    }
    
    static read_function_returns = function() {
        var _result = items_scanner.read_tag_line();
        items_scanner.skip_to_tag();
        return _result;
    }
}
