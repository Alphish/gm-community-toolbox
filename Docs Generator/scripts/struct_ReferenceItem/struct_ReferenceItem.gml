/// @func ReferenceItem(tocnode,parent)
/// @desc A base structure for a merged reference documentation item.
/// @arg {Struct.ReferenceTocNode} tocnode      The corresponding table of contents node.
/// @arg {Struct.ReferenceItem} parent          The parent reference item.
function ReferenceItem(_tocnode, _parent) constructor {
    var _stub = _tocnode.stub;
    
    type = _stub.type;
    keyname = _stub.keyname;
    title = _stub.title;
    summary = _stub.summary;
    sections = _stub.sections;
    filename = _tocnode.filename;
    
    parent = _parent;
    children = [];
    
    if (!is_undefined(_parent))
        array_push(_parent.children, self);
}
