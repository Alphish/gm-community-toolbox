/// @func ToolboxScript(name,path,regions)
/// @desc A structure representing a Community Toolbox script.
/// @arg {Struct.ToolboxProject}    The project the script belongs to.
/// @arg {String} name              The script name (without utils_CommunityToolbox prefix).
function ToolboxScript(_project, _name) constructor {
    type = "script";
    name = _name;
    keyname = string_lower(name);
    path = $"/Community Toolbox/scripts/utils_CommunityToolbox{_name}.gml";
    
    project = _project;
    array_push(project.scripts, self);
    
    regions = [];
    has_regions = false;
}
