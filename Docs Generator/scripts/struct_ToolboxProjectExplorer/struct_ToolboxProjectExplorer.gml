function ToolboxProjectExplorer(_path) constructor {
    // setup
    
    project_path = string_replace_all(_path, "\\", "/");
    project_directory_path = file_path_get_directory(project_path);
    scripts_directory_path = file_path_append(project_directory_path, "scripts");
    utils_directories = file_find_array(scripts_directory_path, "utils_CommunityToolbox*", fa_directory);
    
    project_scripts = [];
    project_data = undefined;
    is_completed = false;
    
    remaining_directories = variable_clone(utils_directories);
    processed_count = 0;
    total_count = array_length(remaining_directories);
    
    // processing
    
    static load_step = function() {
        if (is_completed)
            return;
        
        // originally, I intended to process a single script over multiple frames
        // hence processing multiple load steps in the script parser
        // but I guess it's quick enough that I can process a whole script in a frame, at least for now
        
        var _next_util = array_shift(remaining_directories);
        var _script_parser = new ToolboxScriptParser(_next_util);
        
        var _step_result = false;
        while (!_step_result) {
            _step_result = _script_parser.load_step();
        }
        array_push(project_scripts, _script_parser.toolbox_script);
        
        processed_count++;
        if (processed_count == total_count) {
            is_completed = true;
            project_data = new ToolboxProject(project_directory_path, project_scripts);
        }
    }
}
