function ToolboxUtilsLoader(_toolbox, _scriptdir) constructor {
    toolbox_loader = _toolbox;
    script_directory = _scriptdir;
    gml_path = file_find_single(script_directory, "*.gml", fa_none);
    show_debug_message(gml_path);
}
