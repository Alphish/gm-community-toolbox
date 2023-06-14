/// @func VerrificLogLine(level,status,text)
/// @desc An entry in the Verrific log tool.
/// @arg {Real} level                   The indentation level of the log entry.
/// @arg {Real,Undefined} status        The test status associated with the entry, if any.
/// @arg {String} text                  The text contained in the log.
function VerrificLogLine(_level, _status, _text) constructor {
    level = _level;
    status = _status;
    text = _text;
    
    /// @func for_suite_start(suite)
    /// @desc Creates a log line for starting a new test suite.
    /// @arg {Struct.VerrificSuiteNode} suite           The suite that's about to be started.
    static for_suite_start = function(_suite) {
        return new VerrificLogLine(_suite.level, undefined, $"START SUITE: {_suite.description}");
    }
    
    /// @func for_suite_end(suite)
    /// @desc Creates a log line for finishing a test suite.
    /// @arg {Struct.VerrificSuiteNode} suite           The suite that's just finished.
    static for_suite_end = function(_suite) {
        return new VerrificLogLine(_suite.level, undefined, $"ENDED SUITE: {_suite.description}");
    }
    
    /// @func for_test_start(test)
    /// @desc Creates a log line for running a test.
    /// @arg {Struct.VerrificTestNode} test             The test that's about to be started.
    static for_test_start = function(_test) {
        return new VerrificLogLine(_test.level, undefined, $"RUNNING: {_test.description}");
    }
    
    /// @func for_test_end(test)
    /// @desc Creates a log line for finishing a test.
    /// @arg {Struct.VerrificTestNode} test             The test that's just finished.
    static for_test_end = function(_test) {
        var _status_desc = status_descriptions[_test.status];
        return new VerrificLogLine(_test.level, _test.status, $"{_status_desc}: {_test.description}");
    }
    
    /// @func for_test_message(message)
    /// @desc Creates a log line for a test message.
    /// @arg {Struct.VerrificTestNode} test             The test the message belongs to.
    /// @arg {Struct.VerrificMessage} message           The message to add the log line for.
    static for_test_message = function(_test, _message) {
        return new VerrificLogLine(_test.level + 1, _message.status, "> " + _message.text);
    }
    
    /// @ignore
    static status_descriptions = ["FOUND", "PENDING", "RUNNING", "PASSED", "UNSURE", "UNPROVEN", "FAILED", "CRASHED"];
}

// initializing the statics
var _dummy = new VerrificLogLine(0, undefined, "");
