/// @func string_contains(str,substr)
/// @desc Checks whether the given string contains the substring or not. Always returns true for an empty substringg.
/// @arg {String} str           The string to find the substring in.
/// @arg {String} substr        The string to check.
/// @returns {Bool}
function string_contains(_str, _substr) {
    if (_substr == "")
        return true;
    
    return string_pos(_substr, _str) > 0;
}

/// @func string_to_char_array(str,[oneindexed])
/// @desc Creates an array of characters from a given string. It may be 0-indexed or 1-indexed (it's 0-indexed by default).
/// @arg {String} str           The string to convert to the array.
/// @arg {Bool} [oneindexed]    Whether the first character should start at index of 0 (false) or index of 1 (true).
/// @returns {Array<String>}
function string_to_char_array(_str, _oneindexed = false) {
    var _result = array_create(string_length(_str) + (_oneindexed ? 1 : 0), "");
    var _foreach_context = { result: _result, offset: _oneindexed ? 0 : -1 };
    string_foreach(_str, method(_foreach_context, function(_char, i) {
        result[i + offset] = _char;
    }));
    return _result;
}

/// @func string_interpolate(template,values,[evaluator])
/// @desc Creates a new string from a given template, replacing placeholders between curly braces with corresponding values.
///       By default, placeholders are treated as struct keys to replace with corresponding struct values. Placeholder processing can be customised with an optional evaluator.
/// @arg {String} template          The template to replace placeholders in.
/// @arg {Any} values               The source of values for evaluating placeholders.
/// @arg {Function} [evaluator]     A function returning the placeholder replacement based on given values and placeholder text. 
/// @returns {String}
function string_interpolate(_template, _values, _evaluator = struct_get) {
    // an inner struct with methods for individual processing steps
    static context = {
        segments: undefined,
        segments_count: 0,
        segment_index: 0,
        
        // the entire string interpolation
        interpolate: function(_template, _values, _evaluator) {
            if (_template == "")
                return "";
            
            segments = string_split(_template, "}");
            last_segment_index = array_length(segments) - 1;
            segment_index = 0;
            
            var _last_segment = string_replace_all(segments[last_segment_index], "{{", "{");
            if (last_segment_index == 0) {
                segments = undefined;
                return _last_segment;
            }
            
            // handling all the segments
            while (segment_index < last_segment_index) {
                replace_next_placeholder(_values, _evaluator);
            }
            segments[last_segment_index] = _last_segment;
                
            var _result = string_join_ext("", segments);
            segments = undefined;
            return _result;
        },
        
        // processing a single non-empty placeholder segment
        // taking into account potential multiple closing braces (implied by a series empty segments)
        replace_next_placeholder: function(_values, _evaluator) {
            var _replaced_index = segment_index;
            var _segment = segments[_replaced_index];
            
            // handling the closing brace
            // in particular, whether there's an even or odd number of braces to escape
            // for each pair of closing braces a single brace is added, too
            segment_index++;
            var _is_escaped = false;
            while (segment_index < last_segment_index && segments[segment_index] == "") {
                _is_escaped = !_is_escaped;
                if (_is_escaped)
                    segments[segment_index] = "}";
                
                segment_index++;
            }
            
            // if there was an even number of closing braces
            // treat all of these as escaped and don't replace placeholder
            if (_is_escaped) {
                segments[_replaced_index] = string_replace_all(_segment, "{{", "{");
                return;
            }
            
            // there was an unescaped closing brace
            // so try to process the placeholder inside
            var _replaced_segment = process_segment_placeholder(_segment, _values, _evaluator);
            segments[_replaced_index] = _replaced_segment ?? string_replace_all(_segment, "{{", "{") + "}";
        },
        
        process_segment_placeholder: function(_segment, _values, _evaluator) {
            static trim_braces = ["{"];
        
            // could not find opening brace in the segment, not replacing the placeholder
            var _open_index = string_last_pos("{", _segment);
            if (_open_index < 1)
                return undefined;
        
            var _pre_placeholder = string_copy(_segment, 1, _open_index - 1);
            var _pre_brace = string_trim_end(_pre_placeholder, trim_braces);
            var _extra_open_braces = string_length(_pre_placeholder) - string_length(_pre_brace);
        
            // there's an even total number of opening braces (odd extra + one main)
            // the opening braces are all escaped, so not replacing the placeholder
            if (_extra_open_braces % 2 == 1)
                return undefined;
        
            var _placeholder = string_delete(_segment, 1, _open_index);
            var _result = _evaluator(_values, _placeholder);
        
            // the placeholder didn't evaluate to a valid result, not replacing the placeholder
            if (is_undefined(_result))
                return undefined;
        
            // the placeholder evaluated to a valid value, returning the replaced string
            return string_replace_all(_pre_placeholder, "{{", "{") + string(_result);
        }
    };
    
    return context.interpolate(_template, _values, _evaluator);
}
