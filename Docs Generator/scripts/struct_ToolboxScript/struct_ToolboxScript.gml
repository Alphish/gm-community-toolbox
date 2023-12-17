/// @func ToolboxScript(name,regions)
/// @desc A structure representing a Community Toolbox script.
/// @arg {String} name                              The script name (without utils_CommunityToolbox prefix).
/// @arg {Array<Struct.ToolboxRegion>} regions      The regions contained within the script, or a script-wide anonymous pseudo-region.
function ToolboxScript(_name, _regions) constructor {
    name = _name;
    regions = _regions;
    has_regions = array_length(regions) > 0 && !regions[0].is_anonymous;
}
