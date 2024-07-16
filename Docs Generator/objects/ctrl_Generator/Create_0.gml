image_index = 0;
image_speed = 0;

state = new InitState();
project_path = "";
toolbox_project = undefined;
item_stubs = undefined;
docs_toc = undefined;
toc_home = undefined;
reference_items = undefined;
release_notes = undefined;

failures_log = [];
warnings_log = [];

log_failure = function(_warning) {
    array_push(failures_log, _warning);
}

log_warning = function(_warning) {
    array_push(warnings_log, _warning);
}

gc_enable(false);
