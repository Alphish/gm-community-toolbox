/// @func VerrificTreeVisitor(root)
/// @desc A parent struct for processing a Verrific runtime tree node by node.
/// @arg {Struct.VerrificSuiteNode} root        The root of the Verrific runtime tree.
function VerrificTreeVisitor(_root) constructor {
    root = _root;
    is_started = false;
    is_finished = false;
    
    current_node = root;
    
    // feather ignore GM2043
    prepare_node(root);
    
    // ---------------
    // Visit functions
    // ---------------
    
    /// @func visit_batch(minsteps,maxms)
    /// @desc Continues visiting the tests tree, with a given minimum number of steps and a maximum time elapsed. Returns whether all nodes have been visited.
    /// @arg {Real} minsteps            The minimum number of visit steps to take in this batch.
    /// @arg {Real} maxms               The maximum number of milliseconds to elapse in this batch.
    /// @returns {Bool}
    static visit_batch = function(_minsteps, _maxms) {
        if (is_finished)
            return true;
        
        var _time = get_timer();
        var _target_time = _time + 1000 * _maxms;
        
        repeat (_minsteps) {
            visit_step();
            if (is_finished)
                return true;
        }
        
        while (get_timer() < _target_time) {
            visit_step();
            if (is_finished)
                return true;
        }
        
        return false;
    }
    
    /// @func visit_step()
    /// @desc Processes the current node and returns whether visiting all nodes has finished.
    /// @returns {Bool}
    static visit_step = function() {
        if (!is_started) {
            on_start();
            is_started = true;
        }
        
        if (is_entering)
            enter_node();
        
        if (is_finished)
            return true;
        
        var _node_processed = is_suite ? visit_suite(current_node) : visit_test(current_node);
        if (_node_processed) {
            exit_node(current_node);
            prepare_node(current_node.next_node);
        }
        
        if (is_finished)
            on_finish();
        
        return is_finished;
    }
    
    // -----------------
    // Global processing
    // -----------------
    
    /// @func on_start()
    /// @desc A processing logic to perform before beginning the visiting.
    static on_start = function() {
        // no special logic to perform on starting the visiting
    }
    
    /// @func on_finish()
    /// @desc A processing logic to perform after visiting the entire tree.
    static on_finish = function() {
        // no special logic to perform after visiting the tree
    }
    
    // ----------------------
    // Common node processing
    // ----------------------
    
    /// @ignore
    static prepare_node = function(_node) {
        if (is_undefined(_node)) {
            current_node = undefined;
            is_suite = false;
            is_finished = true;
        } else {
            current_node = _node;
            is_suite = is_instanceof(current_node, VerrificSuiteNode);
            is_entering = true;
        }
    }
    
    /// @ignore
    static enter_node = function() {
        if (is_suite)
            enter_suite(current_node);
        else
            enter_test(current_node);
        
        is_entering = false;
    }
    
    /// @ignore
    static exit_node = function(_node) {
        var _context_node = _node;
        while (_context_node.end_node == _node) {
            if (is_instanceof(_context_node, VerrificSuiteNode))
                exit_suite(_context_node);
            else
                exit_test(_context_node);
            
            if (_context_node.is_root)
                return;
            
            _context_node = _context_node.parent;
        }
    }
    
    // ----------------
    // Suite processing
    // ----------------
    
    /// @func enter_suite(suite)
    /// @desc A processing logic to perform when entering a Verrific suite node.
    /// @arg {Struct.VerrificSuiteNode} suite
    static enter_suite = function(_suite) {
        // no special logic for entering a test suite node
    }
    
    /// @func visit_suite(suite)
    /// @desc The core processing logic to perform when visiting a Verrific suite node. Returns whether visiting the node has finished or not.
    /// @arg {Struct.VerrificSuiteNode} suite
    /// @returns {Bool}
    static visit_suite = function(_suite) {
        // no special logic for visiting a test suite node
        return true;
    }
    
    /// @func exit_suite(suite)
    /// @desc A processing logic to perform when exiting a Verrific suite node (counting from the last inner node).
    /// @arg {Struct.VerrificSuiteNode} suite
    static exit_suite = function(_suite) {
        // no special logic for exiting a test suite node
    }
    
    // ---------------
    // Test processing
    // ---------------
    
    /// @func enter_test(suite)
    /// @desc A processing logic to perform when entering a Verrific test node.
    /// @arg {Struct.VerrificTestNode} test
    static enter_test = function(_test) {
        // no special logic for entering a test node
    }
    
    /// @func visit_test(test)
    /// @desc The core processing logic to perform when visiting a Verrific test node. Returns whether visiting the node has finished or not.
    /// @arg {Struct.VerrificTestNode} test
    /// @returns {Bool}
    static visit_test = function(_test) {
        // no special logic for visiting a test node
        return true;
    }
    
    /// @func exit_test(suite)
    /// @desc A processing logic to perform when exiting a Verrific test node.
    /// @arg {Struct.VerrificTestNode} test
    static exit_test = function(_test) {
        // no special logic for exiting a test node
    }
}
