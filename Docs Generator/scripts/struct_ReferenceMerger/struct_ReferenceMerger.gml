/// @func ReferenceMerger(tochome,project)
/// @desc A tool for merging documentation reference item stubs and the toolbox project data.
/// @arg {Struct.ReferenceTocNode} tochome      The table of contents root node.
/// @arg {Struct.ToolboxProject} project        The toolbox project data.
function ReferenceMerger(_toc, _project) : MultiStepProcess() constructor {
    toc_home = _toc.toc_home;
    toc_entries = toc_home.list_descendants();
    toc_entries_by_name = array_key_by(toc_entries, get_keyname);
    
    releases = _toc.releases;
    
    project = _project;
    project_scripts = project.scripts;
    project_scripts_by_name = array_key_by(project_scripts, get_keyname);
    project_regions = array_flat_map(project_scripts, function(_script) { return _script.regions; });
    project_named_regions = array_filter(project_regions, function(_region) { return !_region.is_anonymous; });
    project_regions_by_name = array_key_by(project_named_regions, get_keyname);
    project_functions = array_flat_map(project_regions, function(_region) { return _region.functions; });
    project_functions_by_name = array_key_by(project_functions, get_keyname);
    
    reference_items = [];
    result = reference_items;
    
    reference_items_by_name = {};
    remaining_toc_entries = variable_clone(toc_entries, 1);
    
    static perform_step = function() {
        if (array_length(remaining_toc_entries) == 0) {
            check_missing_project_items();
            return true;
        }
        
        var _toc_entry = array_shift(remaining_toc_entries);
        var _item = merge_reference_item(_toc_entry);
        if (!is_undefined(_item)) {
            array_push(reference_items, _item);
            reference_items_by_name[$ _item.keyname] = _item;
        }
        
        return false;
    }
    
    // -------------
    // Merging items
    // -------------
    
    static merge_reference_item = function(_toc_entry) {
        var _parent_item = match_reference_parent(_toc_entry);
        var _type = _toc_entry.type;
        switch (_type) {
            case "home":
                return merge_home_item(_toc_entry);
            case "script":
                return merge_script_item(_toc_entry, _parent_item);
            case "region":
                return merge_region_item(_toc_entry, _parent_item);
            case "func":
                return merge_function_item(_toc_entry, _parent_item);
            default:
                throw $"Unknown Table of Contents entry type '{_type}'.";
        }
    }
    
    static match_reference_parent = function(_toc_entry) {
        var _parent = _toc_entry.parent;
        if (is_undefined(_parent))
            return undefined;
        
        var _keyname = _parent.keyname;
        return reference_items_by_name[$ _keyname];
    }
    
    static merge_home_item = function(_toc_entry) {
        return new ReferenceHome(_toc_entry, project);
    }
    
    static match_project_parent = function(_toc_entry, _project_parent) {
        var _parent_entry = _toc_entry.parent;
        if (is_undefined(_parent_entry))
            throw $"Project parent validation applies only to non-home reference items.";
        
        var _parent_toc_keyname = _parent_entry.keyname;
        var _parent_project_keyname = _project_parent.keyname;
        if (_parent_toc_keyname != _parent_project_keyname) {
            var _node_desc = $"{_toc_entry.type} '{_toc_entry.keyname}'";
            var _parent_toc_desc = $"{_parent_entry.type} '{_parent_entry.keyname}'";
            var _parent_project_desc = $"{_project_parent.type} '{_project_parent.keyname}'";
            fail($"Mismatch between parents of {_node_desc}: the parent is {_parent_toc_desc} in the table of contents, but {_parent_project_desc} in the toolbox project.");
            return false;
        }
        
        return true;
    }
    
    static merge_script_item = function(_toc_entry, _parent_item) {
        var _script = project_scripts_by_name[$ _toc_entry.keyname];
        if (is_undefined(_script)) {
            fail($"Could not match script reference item '{_toc_entry.keyname}' to any project script.");
            return undefined;
        }
        
        if (!match_project_parent(_toc_entry, project))
            return undefined;
        
        return new ReferenceScript(_toc_entry, _script, _parent_item);
    }
    
    static merge_region_item = function(_toc_entry, _parent_item) {
        var _region = project_regions_by_name[$ _toc_entry.keyname];
        if (is_undefined(_region)) {
            fail($"Could not match region reference item '{_toc_entry.keyname}' to any project region.");
            return undefined;
        }
        
        if (!match_project_parent(_toc_entry, _region.script))
            return undefined;
        
        return new ReferenceRegion(_toc_entry, _region, _parent_item);
    }
    
    static merge_function_item = function(_toc_entry, _parent_item) {
        var _function = project_functions_by_name[$ _toc_entry.keyname];
        if (is_undefined(_function)) {
            fail($"Could not match function reference item '{_toc_entry.keyname}' to any project function.");
            return undefined;
        }
        
        if (!match_project_parent(_toc_entry, _function.region.is_anonymous ? _function.region.script : _function.region))
            return undefined;
        
        var _arguments = merge_function_arguments(_toc_entry.stub.arguments, _function);
        
        check_releases_order(_toc_entry.stub);
        
        return new ReferenceFunction(_toc_entry, _function, _arguments, _parent_item);
    }
    
    static merge_function_arguments = function(_stub_arguments, _function) {
        var _stub_arguments_by_name = array_key_by(_stub_arguments, function(_argument) { return _argument.keyname; });
        var _function_arguments_by_name = array_key_by(_function.arguments, function(_argument) { return _argument.keyname; });
        
        // validate stub arguments
        var _stub_count = array_length(_stub_arguments);
        for (var i = 0; i < _stub_count; i++) {
            var _stub_argument = _stub_arguments[i];
            if (is_undefined(_function_arguments_by_name[$ _stub_argument.keyname]))
                fail($"Could not match function reference argument '{_stub_argument.keyname}' to any argument of function '{_function.name}'.");
        }
        
        var _result = [];
        var _function_count = array_length(_function.arguments);
        for (var i = 0; i < _function_count; i++) {
            var _function_argument = _function.arguments[i];
            var _stub_argument = _stub_arguments_by_name[$ _function_argument];
            var _item_argument = new ReferenceArgument(_function_argument, _stub_argument);
            array_push(_result, _item_argument);
        }
        return _result;
    }
    
    static check_releases_order = function(_function) {
        var _updates = _function.updates;
        for (var i = 1, _count = array_length(_updates); i < _count; i++) {
            var _previous_version = _updates[i - 1].version;
            var _previous_index = array_get_index(releases, _previous_version);
            var _next_version = _updates[i].version;
            var _next_index = array_get_index(releases, _next_version);
            
            if (_previous_index >= _next_index) {
                warn($"Function '{_function.keyname}' has the {_previous_version} version listed before the {_next_version} version.");
            }
        }
    }
    
    // -----------------
    // Additional checks
    // -----------------
    
    static check_missing_project_items = function() {
        array_foreach(project_scripts, function(_script) {
            if (is_undefined(toc_entries_by_name[$ _script.keyname]))
                warn($"Script '{_script.name}' is not listed in the reference.");
        });
        array_foreach(project_named_regions, function(_region) {
            if (is_undefined(toc_entries_by_name[$ _region.keyname]))
                warn($"Region '{_region.name}' from script '{_region.script.name}' is not listed in the reference.");
        });
        array_foreach(project_functions, function(_function) {
            if (is_undefined(toc_entries_by_name[$ _function.keyname]))
                warn($"Function '{_function.name}' is not listed in the reference.");
        });
    }
    
    // -------------
    // Miscellaneous
    // -------------
    
    static get_warning_header = function() {
        return "Merging reference and project data";
    }
    
    static get_keyname = function(_entity) {
        return _entity.keyname;
    }
}
