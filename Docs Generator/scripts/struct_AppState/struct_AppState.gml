/// @func AppState()
/// @desc A base for a single state in the application state machine.
function AppState() constructor {
    static init = function() {
        return self;
    }
    
    static process = function() {
        throw $"{instanceof(self)}.process is not implemented.";
    }
    
    static get_message = function() {
        return "Processing..."
    }
    
    static get_color = function() {
        return c_yellow;
    }
    
    static error_state = function(_message) {
        return new EndState(_message, c_red);
    }
}
