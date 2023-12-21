image_index = 0;
image_speed = 0;

var _toolbox_path = file_path_resolve(
    file_path_append(GM_project_filename, "..", "..", "Community Toolbox", "Community Toolbox.yyp")
);
if (!file_exists(_toolbox_path)) {
    throw $"Could not find Community Toolbox project at '{_toolbox_path}'.";
}
toolbox_explorer = new ToolboxProjectExplorer(_toolbox_path); 

warnings_log = [];

log_warning = function(_warning) {
    array_push(warnings_log, _warning);
}

gc_enable(false);
