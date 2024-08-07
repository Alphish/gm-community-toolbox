/// @func ReferenceFunctionSubparser(parser)
/// @desc A tool for reading function information from the reference stub.
/// @arg {Struct.ReferenceItemStubsParser} parser       The main reference items parser.
function ReferenceFunctionSubparser(_parser) : ReferenceItemSubparser(_parser) constructor {
    static function_tags = ["arg", "returns", "section", "update"];
    
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
        var _updates = [];
        
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
                
                case "update":
                    var _update = read_update();
                    if (!is_undefined(_update))
                        array_push(_updates, _update);
                    break;
            }
            
            _tag = items_scanner.get_tag();
        }
        
        if (array_length(_updates) == 0) {
            fail($"The function {_keyname} must have at least a single update history entry.");
            return undefined;
        }
        
        return new ReferenceFunctionStub(_keyname, _summary, _arguments, _returns, _sections, _updates);
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
    
    static read_update = function() {
        var _version = items_scanner.read_tag_line();
        if (is_undefined(_version)) {
            fail($"The update entry has no version identifier.");
            return undefined;
        }
        
        var _description = items_scanner.read_content();
        if (is_undefined(_description)) {
            fail($"The update entry has no description.");
            return undefined;
        }
        
        return new ReferenceUpdate(_version, _description);
    }
}
