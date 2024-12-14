/// @func ReadmeWriter()
/// @desc A tool for writing the README file.
function ReadmeWriter() : DocsFileWriter() constructor {
    readme_stub = file_read_all_text("README.stub.md");
    
    static write_file = function(_notes) {
        var _release = array_first(_notes.releases);
        var _content = readme_stub;
        _content = string_replace_all(_content, "{RELEASE_VER}", _release.version);
        _content = string_replace_all(_content, "{RELEASE_LINK}", _release.downloads[0].link);
        _content = string_replace_all(_content, "{RELEASE_GMVER}", _release.gmver);
        
        var _size = string_length(_content);
        buffer_write(content, buffer_string, _content);
        buffer_resize(content, _size);
        buffer_save(content, file_path_append(root_path, "README.md"));
    }
}
