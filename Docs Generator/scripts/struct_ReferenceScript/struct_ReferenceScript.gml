/// @func ReferenceScript(tocnode,script,parent)
/// @desc A structure representing a script in the merged reference documentation.
/// @arg {Struct.ReferenceTocNode} tocnode      The corresponding table of contents node.
/// @arg {Struct.ToolboxScript} script          The corresponding project script data.
/// @arg {Struct.ReferenceItem} parent          The parent reference item.
function ReferenceScript(_tocnode, _script, _parent) : ReferenceItem(_tocnode, _parent) constructor {
    project_script = _script;
}
