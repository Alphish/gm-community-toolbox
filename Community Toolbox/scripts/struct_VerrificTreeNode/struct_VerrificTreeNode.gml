/// @func VerrificTreeNode(parent,index)
/// @desc A parent struct representing a Verrific runtime tree node.
/// @arg {Struct.VerrificSuiteNode,Undefined} parent    The parent node.
/// @arg {Real} index                                   The index of the node within the parent node.
function VerrificTreeNode(_parent, _index) constructor {
    description = "";
    
    is_root = is_undefined(_parent);
    root = is_root ? self : _parent.root;
    parent = _parent;
    index = _index;
    level = is_root ? 0 : _parent.level + 1;
    
    next_node = undefined; // next node to visit in the Verrific runtime tree, if any
    end_node = self; // the last node in this node's subtree
    
    has_items = false;
    items = undefined;
    items_count = 0;
    
    /// @func from_item(parent,index,item)
    /// @desc Creates the appropriate tree node based on the source item.
    /// @arg {Struct.VerrificSuiteNode,Undefined} parent                The parent node.
    /// @arg {Real} index                                               The index of the node within the parent node.
    /// @arg {Struct.VerrificTestStub,Struct.VerrificSuite} item        The item to create a Verrific runtime node for.
    /// @returns {Struct.VerrificTreeNode}
    static from_item = function(_parent, _index, _item) {
        if (is_instanceof(_item, VerrificTestStub))
            return new VerrificTestNode(_parent, _index, _item);
        else
            return new VerrificSuiteNode(_parent, _index, _item);
    }
    
    /// @ignore
    /// Inserts the given node and its subnodes after the current one.
    static insert_next_node = function(_node) {
        _node.end_node.next_node = next_node;
        next_node = _node;
    }
    
    /// @ignore
    /// Updates the last node belonging to the given suite node.
    static update_end_node = function(_node) {
        end_node = _node;
        if (!is_root && parent.items_count == index + 1) {
            parent.update_end_node(_node);
        }
    }
}

// initializing the statics
var _dummy = new VerrificTreeNode(undefined, 0);
