/// @func ReferenceHome(tocnode,project)
/// @desc A structure representing the home page in the merged reference documentation.
/// @arg {Struct.ReferenceTocNode} tocnode      The corresponding table of contents node.
/// @arg {Struct.ToolboxProject} project        The toolbox project data.
function ReferenceHome(_tocnode, _project) : ReferenceItem(_tocnode, undefined) constructor {
    project = _project;
}
