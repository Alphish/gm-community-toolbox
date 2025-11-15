function TextInputFormat() constructor {
    can_parse = function(_text) {
        throw $"{instanceof(self)}.can_parse is not implemented.";
    }
    
    parse = function(_text) {
        throw $"{instanceof(self)}.parse is not implemented.";
    }
    
    format = function(_value) {
        return string(_value);
    }
}
