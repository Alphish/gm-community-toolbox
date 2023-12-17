/// @func ToolboxProject(directory,scripts)
/// @desc A structure representing the entirety of the Community Toolbox, in terms of its exposed functionality.
/// @arg {String} directory                         The directory where the Community Toolbox project resides.
/// @arg {Array<Struct.ToolboxScript> scripts       Data of the Community Toolbox scritps contained in the project.
function ToolboxProject(_directory, _scripts) constructor {
    directory_path = _directory;
    scripts = _scripts;
}
