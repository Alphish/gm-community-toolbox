/// @func VerrificSuiteNode(parent,index,suite)
/// @desc A Verrific runtime tree node keeping track of a test suite.
/// @arg {Struct.VerrificSuiteNode,Undefined} parent    The parent node in the Verrific tree.
/// @arg {Real} index                                   The index of the node within the parent node.
/// @arg {Struct.VerrificSuite} suite                   The test suite wrapped in the node.
function VerrificSuiteNode(_parent, _index, _suite) : VerrificTreeNode(_parent, _index) constructor {
    suite = _suite;
    description = suite.suite_description ?? "<unnamed suite>";
    level = is_undefined(_parent) ? 0 : _parent.level + 1;
    
    is_ready = false;
    processing_crash = undefined;
    status_counter = new VerrificStatusCounter(is_root ? undefined : _parent.status_counter);
    
    /// @func create_root(suite)
    /// @desc Creates a root suite node for the given test suite.
    /// @arg {Struct.VerrificSuite} suite       The suite to create the root node from.
    static create_root = function(_suite) {
        return new VerrificSuiteNode(undefined, 0, _suite);
    }
    
    /// @func add_item_node(node)
    /// @desc Adds an inner node to the suite node.
    /// @arg {Struct.VerrificTreeNode} node     The inner node to add.
    static add_item_node = function(_node) {
        if (is_undefined(items)) {
            add_first_item(_node)
        } else {
            add_next_item(_node);
        }
    }
    
    /// @ignore
    /// Adds the first child item, while updating the node relationships accordingly.
    static add_first_item = function(_node) {
        has_items = true;
        items = [_node];
        items_count = 1;
            
        insert_next_node(_node)
        update_end_node(_node.end_node);
    }
    
    /// @ignore
    /// Adds another child item, while updating the node relationships accordingly.
    static add_next_item = function(_node) {
        var _previous_node = items[items_count - 1];
        array_push(items, _node);
        items_count++;
        
        _previous_node.end_node.insert_next_node(_node);
        update_end_node(_node.end_node);
    }
}
