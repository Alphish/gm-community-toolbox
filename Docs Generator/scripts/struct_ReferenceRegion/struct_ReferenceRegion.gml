/// @func ReferenceRegion(tocnode,region,parent)
/// @desc A structure representing a region in the merged reference documentation.
/// @arg {Struct.ReferenceTocNode} tocnode      The corresponding table of contents node.
/// @arg {Struct.ToolboxRegion} region          The corresponding project region data.
/// @arg {Struct.ReferenceItem} parent          The parent reference item.
function ReferenceRegion(_tocnode, _region, _parent) : ReferenceItem(_tocnode, _parent) constructor {
    project_region = _region;
}
