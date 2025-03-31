function StringInputFormat() : TextInputFormat() constructor {
    can_parse = function(_text) {
        return true;
    }
    
    parse = function(_text) {
        return _text;
    }
    
    format = function(_value) {
        return _value;
    }
}

StringInputFormat.instance = new StringInputFormat();
