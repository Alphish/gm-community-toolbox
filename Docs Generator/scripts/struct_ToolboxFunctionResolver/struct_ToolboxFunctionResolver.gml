/// @func ToolboxFunctionResolver(parser)
/// @desc A tool for checking consistency and putting together complete function data from JSDoc and GML sections.
/// @arg {Struct.ToolboxScriptParser} parser        The toolbox script parser using the resolver.
function ToolboxFunctionResolver(_parser) constructor {
    script_parser = _parser;
    
    static resolve_toolbox_function = function(_region, _jsdoc_data, _gml_signature) {
        if (!_jsdoc_data.is_valid || !_gml_signature.is_valid)
            return get_unresolved();
        
        if (!validate_function_name(_jsdoc_data, _gml_signature))
            return get_unresolved();
        
        if (!validate_url(_jsdoc_data, _gml_signature))
            return get_unresolved();
        
        if (!validate_arguments(_jsdoc_data, _gml_signature))
            return get_unresolved();
        
        return build_function(_region, _jsdoc_data, _gml_signature);
    }
    
    // ----------
    // Validation
    // ----------
    
    static validate_function_name = function(_jsdoc_data, _gml_signature) {
        var _jsdoc_name = _jsdoc_data.function_signature.name;
        var _gml_name = _gml_signature.name;
        if (_jsdoc_name != _gml_name) {
            script_parser.fail($"Inconsistent function name: the JSDoc function name is '{_jsdoc_name}' but the GML function name is '{_gml_name}.'");
            return false;
        }
        
        return true;
    }
    
    static validate_url = function(_jsdoc_data, _gml_signature) {
        static url_format = "http://github.com/Alphish/gm-community-toolbox/blob/main/Docs/Reference/Functions/{0}.md";
        
        static substitutions = {
            "draw_set_colour_alpha": "draw_set_color_alpha",
            "shader_set_uniform_colour": "shader_set_uniform_color",
        };
        
        if (is_undefined(_jsdoc_data.url))
            return true;
        
        var _name = substitutions[$ _gml_signature.name] ?? _gml_signature.name;
        var _expected_url = string(url_format, _name);
        if (_jsdoc_data.url != _expected_url) {
            script_parser.fail($"Invalid URL. Expected URL:\n{_expected_url}");
            return false;
        }
        
        return true;
    }
    
    static validate_arguments = function(_jsdoc_data, _gml_signature) {
        var _jsdoc_signature_args = _jsdoc_data.function_signature.arguments;
        var _jsdoc_details_args = _jsdoc_data.arguments_details;
        var _gml_signature_args = _gml_signature.arguments;
        
        var _jsdoc_signature_count = array_length(_jsdoc_signature_args);
        var _jsdoc_details_count = array_length(_jsdoc_details_args);
        var _gml_signature_count = array_length(_gml_signature_args);
        
        var _last_arg = array_last(_jsdoc_signature_args);
        if (!is_undefined(_last_arg) && _last_arg.is_optional && string_starts_with(_last_arg.name, "...")) {
            // compensating for GML signature not including "rest"-type arguments
            array_push(_gml_signature_args, new GmlArgument(_last_arg.name, undefined));
            _gml_signature_count += 1;
        }
        
        if (_gml_signature_count != _jsdoc_signature_count || _gml_signature_count != _jsdoc_details_count) {
            script_parser.fail($"Inconsistent argument counts: {_jsdoc_signature_count} in JSDoc @func annotation, {_jsdoc_details_args} in JSDoc @arg annotations and {_gml_signature_count} in GML function signature.");
            return false;
        }
        
        var _all_matched = true;
        for (var i = 0; i < _gml_signature_count; i++) {
            var _jsdoc_signature_arg = _jsdoc_signature_args[i];
            var _jsdoc_details_arg = _jsdoc_details_args[i];
            var _gml_signature_arg = _gml_signature_args[i];
            _all_matched = _all_matched && validate_single_argument(_jsdoc_signature_arg, _jsdoc_details_arg, _gml_signature_arg);
        }
        return _all_matched;
    }
    
    static validate_single_argument = function(_jsdoc_signature, _jsdoc_details, _gml_signature) {
        // name consistency
        if (_gml_signature.name != _jsdoc_signature.name || _gml_signature.name != _jsdoc_details.name) {
            script_parser.fail($"Inconsistent argument name: '{_jsdoc_signature.name}' in JSDoc @func annotation, '{_jsdoc_details.name}' in JSDoc @arg annotations and '{_gml_signature.name}' in GML function signature.");
            return false;
        }
        var _name = _gml_signature.name;
        
        // optionality consistency
        if (_jsdoc_details.is_optional && !_jsdoc_signature.is_optional) {
            script_parser.fail($"Inconsistent argument '{_name}' optionality: Argument is marked as optional in JSDoc @arg annotation, but not in JSDoc @func annotation.");
            return false;
        } else if (_jsdoc_signature.is_optional && !_jsdoc_details.is_optional) {
            script_parser.fail($"Inconsistent argument '{_name}' optionality: Argument is marked as optional in JSDoc @func annotation, but not in JSDoc @arg annotation.");
            return false;
        } else if (_gml_signature.has_default && !_jsdoc_signature.is_optional) {
            script_parser.fail($"Inconsistent argument '{_name}' optionality: GML function signature has a default value of '{_gml_signature.default_value}' but JSDoc marks argument as non-optional.");
            return false;
        }
        
        return true;
    }
    
    // ----------------------
    // Building function data
    // ----------------------
    
    static get_unresolved = function() {
        script_parser.fail($"Could not resolve function because of invalid data. Check earlier warnings for more details.");
        return undefined;
    }
    
    static build_function = function(_region, _jsdoc_data, _gml_signature) {
        var _name = _jsdoc_data.function_signature.name;
        var _description = _jsdoc_data.description;
        var _returns = _jsdoc_data.return_type;
        var _line = _gml_signature.line;
        
        var _arguments = [];
        var _arguments_count = array_length(_jsdoc_data.arguments_details);
        for (var i = 0; i < _arguments_count; i++) {
            var _jsdoc_arg = _jsdoc_data.arguments_details[i];
            var _gml_arg = _gml_signature.arguments[i];
            array_push(_arguments, build_function_argument(_jsdoc_arg, _gml_arg));
        }
        
        return new ToolboxFunction(_region, _name, _description, _arguments, _returns, _line);
    }
    
    static build_function_argument = function(_jsdoc_arg, _gml_arg) {
        var _datatype = _jsdoc_arg.datatype;
        var _name = _jsdoc_arg.name;
        var _optional = _jsdoc_arg.is_optional;
        var _default = _gml_arg.default_value;
        var _description = _jsdoc_arg.description;
        return new ToolboxArgument(_datatype, _name, _optional, _default, _description);
    }
}