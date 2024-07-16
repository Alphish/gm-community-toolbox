/// @func ReferenceFunctionWriter()
/// @desc A tool for writing functions reference pages.
function ReferenceFunctionWriter() : ReferenceItemWriter() constructor {
    static write_file = function(_function) {
        write_breadcrumbs(_function);
        
        write_title(_function.title);
        write_source_link(_function.get_source_path());
        write_summary(_function.summary);
        write_arguments(_function.arguments);
        write_return_type(_function);
        write_sections(_function.sections);
        write_update_history(_function.updates);
        
        save_content(_function.get_page_path());
    }
    
    // ---------
    // Arguments
    // ---------
    
    static write_arguments = function(_argument) {
        write_line();
        write_line("###### Arguments");
        
        write_line();
        write_arguments_header_row();
        var _arguments_count = array_length(_argument);
        for (var i = 0; i < _arguments_count; i++) {
            write_argument_row(_argument[i]);
        }
    }
    
    static write_arguments_header_row = function() {
        write_row("Argument", "Type", "Usage", "Description");
        write_row_alignment(fa_center, fa_center, fa_center, fa_left);
    }
    
    static write_argument_row = function(_argument) {
        var _name = $"**{_argument.name}**";
        var _type = $"**`{_argument.datatype}`**";
        
        var _usage = "";
        if (!is_undefined(_argument.usage))
            _usage = _argument.usage;
        else if (!is_undefined(_argument.default_value))
            _usage = $"Default: `{_argument.default_value}`";
        else if (_argument.is_optional)
            _usage = $"Optional";
        else
            _usage = "**Required**";
        
        var _description = string_replace_all(_argument.description, "\r\n", "<br>");
        write_row(_name, _type, _usage, _description);
    }
    
    // -----------
    // Return type
    // -----------
    
    static write_return_type = function(_function) {
        write_line();
        write_line("###### Returns");
        
        if (!is_undefined(_function.return_description))
            write_line(_function.return_description);
        else if (!is_undefined(_function.return_type))
            write_line($"**`{_function.return_type}`**");
        else
            write_line("N/A");
    }
    
    // -------
    // Updates
    // -------
    
    static write_update_history = function(_updates) {
        write_section_header("Update history");
        write_line();
        array_foreach(_updates, function(_update) {
            var _version = string_trim(_update.version);
            var _description = string_trim(_update.description);
            write_line($"- **{_version}** - {_description}");
        });
    }
}
