/// @func VerrificTreeLoader(root)
/// @desc A Verrific tree visitor that searches and prepares all the suites and tests, within the given root suite.
/// @arg {Struct.VerrificSuiteNode} root        The root of the Verrific runtime tree.
function VerrificTreeLoader(_root) : VerrificTreeVisitor(_root) constructor {
    
    /// @func visit_suite(suite)
    /// @desc Explores the test suite in the given Verrific suite node.
    /// @arg {Struct.VerrificSuiteNode} suite
    /// @returns {Bool}
    static visit_suite = function(_node) {
        try {
            var _suite = _node.suite;
            _suite.suite_explore();
            if (_suite.suite_is_explored)
                populate_suite(_node, _suite);
            
            return _suite.suite_is_explored;
        } catch (_exception) {
            _node.processing_crash = _exception;
            return true;
        }
    }
    
    /// @func exit_suite(suite)
    /// @desc Marks the Verrific suite node as ready when exiting it.
    /// @arg {Struct.VerrificSuiteNode} suite
    static exit_suite = function(_node) {
        _node.is_ready = true;
    }
    
    /// @ignore
    /// Generates the Verrific runtime tree nodes for the given suite items.
    static populate_suite = function(_node, _suite) {
        _node.description = _suite.suite_description ?? "<unnamed suite>";
        var _count = array_length(_suite.suite_items);
        for (var i = 0; i < _count; i++) {
            var _subnode = VerrificTreeNode.from_item(_node, i, _suite.suite_items[i]);
            _node.add_item_node(_subnode);
        }
    }
}
