/// @func MultiStepProcess()
/// @desc A base for data processing potentially taking multiple steps.
function MultiStepProcess() constructor {
    is_completed = false;
    is_failed = false;
    result = undefined;
    
    static run_next_step = function() {
        if (is_completed)
            return true;
        
        is_completed = perform_step();
        return is_completed;
    }
    
    static run_to_end = function() {
        while (!is_completed) {
            is_completed = perform_step();
        }
        return is_completed;
    }
    
    static perform_step = function() {
        throw $"{instanceof(self)}.perform_step() is not implemented.";
    }
    
    static get_warning_header = function() {
        throw $"{instanceof(self)}.get_warning_header() is not implemented.";
    }
    
    static warn = function(_message) {
        var _header = get_warning_header();
        var _warning = $"{_header}:\n{_message}";
        ctrl_Generator.log_warning(_warning);
    }
    
    static fail = function(_message) {
        is_failed = true;
        var _header = get_warning_header();
        var _warning = $"{_header}:\n{_message}";
        ctrl_Generator.log_failure(_warning);
    }
}
