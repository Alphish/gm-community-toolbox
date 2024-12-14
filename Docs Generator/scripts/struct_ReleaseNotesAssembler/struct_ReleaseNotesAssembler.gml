/// @func ReleaseNotesAssembler(docstoc,reference)
/// @desc A tool for assembling release notes information based on table-of-contents release ordering and function updates.
/// @arg {Struct.DocsTableOfContents} docstoc           The documentation table of contents listing the releases.
/// @arg {Array<Struct.ReferenceItem>} reference        Reference items to get the updates information from.
function ReleaseNotesAssembler(_docstoc, _reference) : MultiStepProcess() constructor {
    releases = _docstoc.releases;
    releases_by_version = {};
    array_foreach(releases, function(_release) {
        releases_by_version[$ _release.version] = {
            version: _release.version,
            downloads: _release.downloads,
            groups: [],
            groups_by_name: {}
        };
    });
    
    result = undefined;
    
    remaining_functions = array_filter(_reference, function(_item) { return is_instanceof(_item, ReferenceFunction); });
    
    static perform_step = function() {
        if (array_length(remaining_functions) == 0) {
            result = create_release_notes();
            return true;
        }
        
        var _function = array_shift(remaining_functions);
        for (var i = 0, _count = array_length(_function.updates); i < _count; i++) {
            add_update(_function, _function.updates[i]);
        }
        return false;
    }
    
    // -----------------
    // Gathering updates
    // -----------------
    
    static add_update = function(_function, _update) {
        // retrieving the release by the version
        var _version = _update.version;
        if (!struct_exists(releases_by_version, _version)) {
            fail($"Function '{_function.keyname}' references unknown release version {_version}.");
            return undefined;
        }
        var _release_data = releases_by_version[$ _version];
        
        // retrieving the release notes group by function parent
        var _group_keyname = _function.parent.keyname;
        if (!struct_exists(_release_data.groups_by_name, _group_keyname)) {
            var _title = _function.parent.title;
            if (is_instanceof(_function.parent, ReferenceRegion))
                _title = _function.parent.parent.title + ": " + _title;
            
            var _group = { keyname: _group_keyname, title: _title, entries: [] };
            array_push(_release_data.groups, _group);
            _release_data.groups_by_name[$ _group_keyname] = _group;
        }
        var _group = _release_data.groups_by_name[$ _group_keyname];
        
        // adding the update entry proper
        array_push(_group.entries, { func: _function, description: _update.description });
    }
    
    // ----------------------
    // Creating release notes
    // ----------------------
    
    static create_release_notes = function() {
        var _releases = array_map(releases, method(self, create_package_release));
        return new ReleaseNotes(_releases);
    }
    
    static create_package_release = function(_release) {
        var _version = _release.version;
        var _release_data = releases_by_version[$ _version];
        var _groups = array_map(_release_data.groups, method(self, create_release_group));
        return new PackageRelease(_version, _release.downloads, _groups, _release.gmver);
    }
    
    static create_release_group = function(_group) {
        var _entries = array_map(_group.entries, method(self, create_release_entry));
        return new PackageReleaseGroup(_group.keyname, _group.title, _entries);
    }
    
    static create_release_entry = function(_entry) {
        return new PackageReleaseEntry(_entry.func, _entry.description);
    }
    
    // -------------
    // Miscellaneous
    // -------------
    
    static get_warning_header = function() {
        return "Assembling release notes";
    }
}
