/// @func DocsItemsLoadingState()
/// @desc A state for parsing reference item stubs data.
function DocsItemsLoadingState() : AppState() constructor {
    reference_explorer = undefined;
    
    static init = function() {
        var _project_path = string_replace_all(GM_project_filename, "\\", "/");
        var _project_directory_path = file_path_get_directory(_project_path);
        var _reference_directory_path = file_path_append(_project_directory_path, "datafiles", "Reference");
        if (!directory_exists(_reference_directory_path))
            return error_state($"Could not find reference stubs directory at '{_reference_directory_path}'.");
        
        reference_explorer = new ReferenceItemStubsExplorer(_reference_directory_path);
        return self;
    }
    
    static process = function() {
        reference_explorer.run_next_step();
        if (!reference_explorer.is_completed)
            return self;
        
        if (reference_explorer.is_failed)
            return error_state($"Problems found when reading reference stubs files.");
        
        ctrl_Generator.item_stubs = reference_explorer.result;
        return new EndState("Reference stubs loading finished successfully!", c_lime);
    }
    
    static get_message = function() {
        return $"Loading reference stubs, processed files: {reference_explorer.processed_count}/{reference_explorer.total_count}";
    }
}