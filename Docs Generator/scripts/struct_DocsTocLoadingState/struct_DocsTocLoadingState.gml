/// @func DocsTocLoadingState()
/// @desc A state for parsing Table of Contents data.
function DocsTocLoadingState() : AppState() constructor {
    toc_parser = undefined;
    
    static init = function() {
        var _project_path = string_replace_all(GM_project_filename, "\\", "/");
        var _project_directory_path = file_path_get_directory(_project_path);
        var _reference_directory_path = file_path_append(_project_directory_path, "datafiles", "Reference");
        var _toc_path = file_find_single(_reference_directory_path, "TOC.txt", fa_none);
        if (!file_exists(_toc_path))
            return error_state($"Could not find Table of Contents file at '{_toc_path}'.");
        
        toc_parser = new ReferenceTocParser(_toc_path, ctrl_Generator.item_stubs);
        return self;
    }
    
    static process = function() {
        toc_parser.run_to_end();
        if (toc_parser.is_failed)
            return error_state($"Problems found when reading Table of Contents file.");
        
        ctrl_Generator.docs_toc = toc_parser.result;
        ctrl_Generator.toc_home = toc_parser.result.toc_home;
        return new ReferenceMergingState();
    }
    
    static get_message = function() {
        return $"Loading Table of Contents...";
    }
}