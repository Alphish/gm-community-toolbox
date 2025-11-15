/// @func JsdocAnnotationBuilder(parser)
/// @desc A tool for collecting and building JSDoc annotation data of the current Toolbox function, following the Community Toolbox conventions.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser parsing the JSDoc.
function JsdocAnnotationBuilder(_parser) constructor {
    script_parser = _parser;
    
    last_tag = undefined;
    last_order = -1;
    
    function_signature = undefined;
    url = undefined;
    description = undefined;
    arguments_details = [];
    return_type = undefined;
    
    // -------------------
    // Handling JSDoc tags
    // -------------------
    
    static tag_order = [
        "func",
        "url",
        "desc",
        "arg",
        "returns",
        "pure",
    ];
    
    static preferred_tags = {
        "function": "func",
        "description": "desc",
        "argument": "arg",
        "param": "arg",
        "parameter": "arg",
        "return": "returns",
    };
    
    static unsupported_tags = [
        "ignore",
        "deprecated",
        "context",
        "self",
    ];
    
    static normalize_tag = function(_tag) {
        // ignoring certain tags
        if (array_contains(unsupported_tags, _tag)) {
            script_parser.fail($"The JSDoc tag '{_tag}' is not applicable to Community Toolbox scripts.");
            return undefined;
        }
        
        // using preferred forms of the basic tags
        if (struct_exists(preferred_tags, _tag)) {
            var _preferred = preferred_tags[$ _tag];
            script_parser.warn($"The JSDoc tag '{_preferred}' is preferred to '{_tag}'.");
            _tag = _preferred;
        }
        
        // ensuring proper tags ordering
        var _new_order = array_get_index(tag_order, _tag);
        if (_new_order == -1) {
            script_parser.fail($"Unknown JSDoc tag: '{_tag}'.");
            return undefined;
        }
        
        if (_new_order < last_order) {
            script_parser.warn($"The JSDoc tag '{_tag}' should go before '{last_tag}'.");
        } else {
            last_order = _new_order;
            last_tag = _tag;
        }
        
        // passing the normalized tag
        return _tag;
    }
    
    // --------------------
    // Accepting JSDoc data
    // --------------------
    
    static accept_function_signature = function(_signature) {
        if (!is_undefined(function_signature)) {
            script_parser.fail($"Multiple function JSDoc annotations found.");
            return;
        }
        function_signature = _signature;
    }
    
    static accept_url = function(_url) {
        if (!is_undefined(url)) {
            script_parser.fail($"Multiple URL JSDoc annotations found.");
            return;
        }
        url = _url;
    }
    
    static accept_description = function(_description) {
        if (!is_undefined(description)) {
            script_parser.fail($"Multiple description JSDoc annotations found.");
            return;
        }
        description = _description;
    }
    
    static accept_argument = function(_argument) {
        array_push(arguments_details, _argument);
    }
    
    static accept_return_type = function(_returns) {
        if (!is_undefined(return_type)) {
            script_parser.fail($"Multiple return type JSDoc annotations found.");
            return;
        }
        return_type = _returns;
    }
    
    // ----------------------------
    // Building the annotation data
    // ----------------------------
    
    static build = function() {
        if (is_undefined(function_signature))
            script_parser.fail("Missing @func annotation in the function's JSDoc.");
        
        if (is_undefined(url))
            script_parser.fail("Missing @url annotation in the function's JSDoc.");
        
        if (is_undefined(description))
            script_parser.fail("Missing @desc annotation in the function's JSDoc.");
        
        return new JsdocAnnotationData(function_signature, url, description, arguments_details, return_type);
    }
}
