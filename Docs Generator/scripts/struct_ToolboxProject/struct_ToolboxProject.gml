/// @func ToolboxProject(directory,scripts)
/// @desc A structure representing the entirety of the Community Toolbox, in terms of its exposed functionality.
/// @arg {String} directory                         The directory where the Community Toolbox project resides.
function ToolboxProject(_directory) constructor {
    type = "home";
    keyname = "home";
    
    directory_path = _directory;
    scripts = [];
}
