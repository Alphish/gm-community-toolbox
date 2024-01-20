/// @func ReferenceTocNode(type,keyname,filename,stub)
/// @desc A structure representing a node in table of contents tree.
/// @arg {String} type                          The type of the reference item.
/// @arg {String} keyname                       The name identifying the reference item and project entity.
/// @arg {String} filename                      The filename to save the reference page at.
/// @arg {Struct.ReferenceItemStub} stub        The reference item stub the entry corresponds to.
function ReferenceTocNode(_type, _keyname, _filename, _stub) constructor {
    type = _type;
    keyname = _keyname;
    filename = string_ends_with(_filename, ".md") ? _filename : _filename + ".md";
    stub = _stub;
    
    parent = undefined;
    children = [];
    
    static list_descendants = function() {
        var _result = [];
        populate_descendants(_result);
        return _result;
    }
    
    static populate_descendants = function(_target) {
        array_push(_target, self);
        
        var _count = array_length(children);
        for (var i = 0; i < _count; i++) {
            var _child = children[i];
            _child.populate_descendants(_target);
        }
    }
}
