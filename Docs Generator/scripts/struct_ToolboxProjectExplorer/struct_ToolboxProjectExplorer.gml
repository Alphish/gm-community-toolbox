/// @func ToolboxProjectExplorer(path)
/// @desc A tool for finding and processing utility scripts found in the Community Toolbox.
/// @arg {String} path      The path where the toolbox project is.
function ToolboxProjectExplorer(_path) : MultiStepProcess() constructor {
    // setup
    
    project_path = string_replace_all(_path, "\\", "/");
    project_directory_path = file_path_get_directory(project_path);
    scripts_directory_path = file_path_append(project_directory_path, "scripts");
    utils_directories = file_find_array(scripts_directory_path, "utils_CommunityToolbox*", fa_directory);
    
    result = new ToolboxProject(project_directory_path);
    project = result;
    
    remaining_directories = variable_clone(utils_directories);
    processed_count = 0;
    total_count = array_length(remaining_directories);
    
    // processing
    
    static perform_step = function() {
        var _next_util = array_shift(remaining_directories);
        var _script_parser = new ToolboxScriptParser(project, _next_util);
        _script_parser.run_to_end();
        
        if (_script_parser.is_failed)
            is_failed = true;
        
        processed_count++;
        return processed_count >= total_count;
    }
}
