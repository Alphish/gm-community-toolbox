/// @func ProjectLoadingState()
/// @desc A state for parsing Community Toolbox utility scripts data.
function ProjectLoadingState() : AppState() constructor {
    toolbox_explorer = undefined;
    
    static init = function() {
        var _docs_path = GM_project_filename;
        var _toolbox_path = file_path_resolve(
            file_path_append(_docs_path, "..", "..", "Community Toolbox", "Community Toolbox.yyp")
        );
        
        if (!file_exists(_toolbox_path))
            return error_state("Could not find community toolbox project relative to the docs generator project.\nMake sure to launch docs generator from the Community Toolbox repository.");
        
        toolbox_explorer = new ToolboxProjectExplorer(_toolbox_path);
        ctrl_Generator.project_path = toolbox_explorer.project_path;
        return self;
    }
    
    static process = function() {
        toolbox_explorer.run_next_step();
        
        if (!toolbox_explorer.is_completed)
            return self;
        
        if (toolbox_explorer.is_failed)
            return error_state("Problems found when reading functions data from the Community Toolbox project.");
        
        ctrl_Generator.toolbox_project = toolbox_explorer.result;
        return new EndState("Project loading finished successfully!", c_lime);
    }
    
    static get_message = function() {
        return $"Loading toolbox project, processed scripts: {toolbox_explorer.processed_count}/{toolbox_explorer.total_count}";
    }
}
