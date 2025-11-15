function StringInputFormat(_allowempty) : TextInputFormat() constructor {
    allow_empty = _allowempty;
    
    can_parse = function(_text) {
        return allow_empty || _text != "";
    }
    
    parse = function(_text) {
        return _text;
    }
    
    format = function(_value) {
        return _value;
    }
}

StringInputFormat.instance = new StringInputFormat(true);
StringInputFormat.non_empty = new StringInputFormat(false);
