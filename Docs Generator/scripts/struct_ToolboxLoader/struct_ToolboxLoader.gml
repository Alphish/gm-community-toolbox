function ToolboxLoader(_path) constructor {
    // setup
    
    project_path = string_replace_all(_path, "\\", "/");
    
    var _last_segment_pos = string_last_pos("/", project_path);
    project_directory_path = string_delete(project_path, _last_segment_pos, string_length(project_path) - _last_segment_pos + 1);
    scripts_directory_path = $"{project_directory_path}/scripts";
    utils_directories = file_find_array(scripts_directory_path, "utils_CommunityToolbox*", fa_directory);
    
    remaining_directories = variable_clone(utils_directories);
    processed_count = 0;
    total_count = array_length(remaining_directories);
    current_loader = undefined;
    
    // processing
    
    static load_step = function() {
        if (processed_count == total_count)
            return;
        
        var _next_util = array_shift(remaining_directories);
        current_loader = new ToolboxUtilsLoader(self, _next_util);
        processed_count++;
    }
}
