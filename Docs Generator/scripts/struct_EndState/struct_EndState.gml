/// @func EndState(message,color)
/// @desc A state showing a success or error message after the processing has finished.
function EndState(_message, _color) : AppState() constructor {
    message = _message;
    color = _color;
    
    static process = function() {
        return self;
    }
    
    static get_message = function() {
        return message;
    }
    
    static get_color = function() {
        return color;
    }
}
