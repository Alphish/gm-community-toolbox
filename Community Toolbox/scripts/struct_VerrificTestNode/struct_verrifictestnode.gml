/// @func VerrificTestNode(suite,index,stub)
/// @desc A Verrific runtime tree node keeping track of a single test.
/// @arg {Struct.VerrificSuiteNode} parent      The parent node in the Verrific tree.
/// @arg {Real} index                           The index of the node within the parent node.
/// @arg {Struct.VerrificTestStub} stub         The stub of the test to run.
function VerrificTestNode(_suite, _index, _stub) : VerrificTreeNode(_suite, _index) constructor {
    test_stub = _stub;
    test_instance = undefined;
    description = _stub.description;
    
    is_scheduled = false;
    is_finished = false;
    test_run = undefined;
    status = VerrificStatus.Found;
    
    suite = _suite;
    suite.status_counter.add_test_status(status);
    
    /// @func schedule()
    /// @desc Marks the test as scheduled for running.
    static schedule = function() {
        is_scheduled = true;
        is_finished = false;
        test_run = undefined;
        update_status();
    }
    
    /// @func run()
    /// @desc Runs the test.
    static run = function() {
        if (!instance_exists(test_run))
            test_run = new VerrificTestRun(test_stub);
        
        test_run.execute();
        update_status();
        is_finished = test_run.is_finished;
    }
    
    /// @ignore
    static update_status = function() {
        var _old_status = status;
        var _new_status;
        if (!is_undefined(test_run))
            _new_status = test_run.calculate_status();
        else
            _new_status = is_scheduled ? VerrificStatus.Pending : VerrificStatus.Found;
        
        if (_old_status == _new_status)
            exit;
        
        status = _new_status;
        if (!is_undefined(suite))
            suite.status_counter.change_test_status(_old_status, _new_status);
    }
    
    /// @func get_messages()
    /// @desc Gets the messages accumulated throughout the test run.
    /// @returns {Array<Struct.VerrificMessage>}
    static get_messages = function() {
        return test_run.messages;
    }
}
