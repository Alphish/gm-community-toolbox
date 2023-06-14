/// @func VerrificTestRun(stub)
/// @desc A struct for keeping track of a test run.
/// @arg {Struct.VerrificTestStub} stub     The stub of the test to run.
function VerrificTestRun(_stub) constructor {
    test_stub = _stub;
    test_instance = undefined;
    test_progress = undefined;
    
    is_finished = false;
    is_asserted = false;
    is_unsure = false;
    is_failed = false;
    is_crashed = false;
    
    messages = [];
    failures = [];
    
    /// @func execute()
    /// @desc Proceeds with the test run, if it's not finished yet.
    static execute = function() {
        if (is_finished)
            exit;
        
        execute_step();
        if (is_finished) {
            execute_cleanup();
            report_unproven();
        }
    }
    
    /// @ignore
    static execute_step = function() {
        try {
            if (is_undefined(test_instance))
                test_instance = test_stub.create_test(self);
            
            test_instance.test_execute();
            is_finished = true;
        } catch (_exception) {
            handle_exception(_exception);
            is_finished = true;
        }
    }
    
    /// @ignore
    static report_unproven = function() {
        if (calculate_status() == VerrificStatus.Unproven) {
            record_message(new VerrificMessage("Make at least one assertion to verify your results.", VerrificStatus.Unproven));
            record_message(new VerrificMessage("Alternatively, call assert_pass() if the test not failing/crashing counts as a success.", VerrificStatus.Unproven));
        }
    }
    
    /// @ignore
    static execute_cleanup = function() {
        try {
            // if the constructor crashes, there is no test left for cleanup
            if (!is_undefined(test_instance))
                test_instance.test_cleanup();
        } catch (_exception) {
            // in case someone actually gets their cleanup logic to crash...
            handle_exception(_exception);
        }
    }
    
    /// @func record_assertion()
    /// @desc Records the test as asserted.
    static record_assertion = function() {
        is_asserted = true;
    }
    
    /// @func record_message(message)
    /// @desc Records a message from the test progress.
    /// @arg {Struct.VerrificMessage,String} message        The message to record.
    static record_message = function(_message) {
        if (is_string(_message))
            _message = new VerrificMessage(_message);
        
        array_push(messages, _message);
        if (_message.is_failure) {
            is_failed = true;
            array_push(failures, _message);
        }
        
        if (_message.is_crash) {
            is_crashed = true;
        }
    }
    
    /// @func record_failure(failure)
    /// @desc Records a failure encountered during the test.
    /// @arg {Struct.VerrificFailure,String} failure        The failure to record.
    static record_failure = function(_failure) {
        if (is_string(_failure))
            _failure = new VerrificFailure(_failure);
        
        record_message(_failure);
    }
    
    /// @func ensure_no_failure([message])
    /// @desc Makes sure no failures were encountered so far, interrupts the test otherwise.
    /// @arg {String} message           A message to show if the interruption happened.
    static ensure_no_failure = function(_message = undefined) {
        if (!is_failed)
            return;
        
        throw new VerrificBreak(_message ?? "Interrupting the test because of assertion failures.");
    }
    
    /// @func finish_unsure([message])
    /// @desc Interrupts the test with the unsure result (neither passing nor failure).
    /// @arg {String} message           A message to explain why the test is not conclusive.
    static finish_unsure = function(_message = undefined) {
        is_unsure = true;
        throw new VerrificBreak(_message ?? "The test couldn't be resolved as passing or failing.", VerrificStatus.Unsure);
    }
    
    /// @ignore
    static handle_exception = function(_exception) {
        var _message;
        if (is_instanceof(_exception, VerrificBreak))
            _message = _exception; // it's an intentional interruption, not a crash
        else
            _message = new VerrificCrash(_exception);
        
        record_message(_message);
    }
    
    /// @func calculate_status()
    /// @desc Calculates the current test status based on the state so far.
    /// #returns {Real}
    static calculate_status = function() {
        if (is_crashed)
            return VerrificStatus.Crashed;
        else if (is_failed)
            return VerrificStatus.Failed;
        else if (is_unsure)
            return VerrificStatus.Unsure;
        else if (!is_finished)
            return VerrificStatus.Running;
        else if (!is_asserted)
            return VerrificStatus.Unproven;
        else
            return VerrificStatus.Passed;
    }
}
