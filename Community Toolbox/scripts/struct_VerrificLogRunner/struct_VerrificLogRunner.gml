/// @func VerrificLogRunner(root)
/// @desc A Verrific tree visitor that runs the tests and reports their outcomes in the log tool.
/// @arg {Struct.VerrificSuiteNode} root        The root of the Verrific runtime tree.
function VerrificLogRunner(_root) : VerrificTreeVisitor(_root) constructor {
    
    // Reports the number of tests found at start
    static on_start = function() {
        add_log_line($"{root.status_counter.total} tests found...");
    }
    
    // Writes a message about starting a test suite on entering the suite
    static enter_suite = function(_suite) {
        var _line = VerrificLogLine.for_suite_start(_suite);
        add_log_line(_line);
    }
    
    // Writes a message about ending a test suite on exiting the suite
    static exit_suite = function(_suite) {
        var _line = VerrificLogLine.for_suite_end(_suite);
        add_log_line(_line);
    }
    
    // Writes a message about running a test on entering the test
    static enter_test = function(_test) {
        var _line = VerrificLogLine.for_test_start(_test);
        add_log_line(_line);
        _test.schedule();
    }
    
    // Keeps processing the visited test node until the test is completed
    static visit_test = function(_test) {
        _test.run();
        return _test.is_finished;
    }
    
    // Writes the outcome of the test on exiting it
    static exit_test = function(_test) {
        var _test_line = VerrificLogLine.for_test_end(_test);
        replace_log_line(_test_line);
        
        var _messages = _test.get_messages();
        var _count = array_length(_messages);
        for (var i = 0; i < _count; i++) {
            var _message = _messages[i];
            var _message_line = VerrificLogLine.for_test_message(_test, _message);
            add_log_line(_message_line);
        }
    }
    
    // Writes a summary of all tests on completing the visit
    static on_finish = function() {
        add_log_line("");
        add_log_line("All tests finished!");
        add_log_line(root.status_counter.get_summary());
    }
    
    /// @ignore
    static add_log_line = function(_line) {
        if (is_string(_line))
            _line = new VerrificLogLine(0, undefined, _line);
        
        array_push(ctrl_VerrificLog.lines, _line);
        ui_VerrificLogView.scroll_to_bottom();
    }
    
    /// @ignore
    static replace_log_line = function(_line) {
        var _idx = array_length(ctrl_VerrificLog.lines) - 1;
        ctrl_VerrificLog.lines[_idx] = _line;
        ui_VerrificLogView.scroll_to_bottom();
    }
}
