/// @func ReleaseNotesWriter()
/// @desc A tool for writing the release notes file.
function ReleaseNotesWriter() : DocsFileWriter() constructor {
    static write_file = function(_notes) {
        write_line("# Release notes");
        write_line("Below is the releases history, with detailed information about specific functions affected.");
        
        array_foreach(_notes.releases, method(self, write_release));
        
        save_content("RELEASENOTES.md");
    }
    
    static write_release = function(_release) {
        write_section_header(_release.version);
        write_line();
        array_foreach(_release.groups, method(self, write_release_group));
    }
    
    static write_release_group = function(_group) {
        write_line($"- **{_group.title}**");
        array_foreach(_group.entries, method(self, write_release_entry));
    }
    
    static write_release_entry = function(_entry) {
        var _function_link = link(_entry.func.title, _entry.func.get_page_path());
        var _description = string_trim(_entry.description);
        write_line($"    - {_function_link} - {_description}");
    }
}
