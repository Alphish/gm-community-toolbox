function IntegerInputFormat(_nullable) : TextInputFormat() constructor {
    is_nullable = _nullable;
    
    can_parse = function(_text) {
        if (is_nullable) {
            if (_text == "")
                return true;
            
            var _word = string_lower(_text);
            if (_word == "undefined" || _word == "null" || _word == "none")
                return true;
        }
        
        if (string_starts_with(_text, "-"))
            _text = string_delete(_text, 1, 1);
        
        if (_text == "")
            return false;
        
        if (string_length(_text) > 15)
            return false;
        
        if (string_digits(_text) != _text)
            return false;
        
        return true;
    }
    
    parse = function(_text) {
        if (string_digits(_text) != "")
            return real(_text);
        else
            return undefined;
    }
    
    format = function(_value) {
        if (is_undefined(_value))
            return "undefined";
        
        return string(_value);
    }
}

IntegerInputFormat.instance = new IntegerInputFormat(false);
IntegerInputFormat.nullable = new IntegerInputFormat(true);
