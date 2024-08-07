/// @func ReleaseNotesWritingState()
/// @desc A state for writing the release notes file.
function ReleaseNotesWritingState() : AppState() constructor {
    release_notes_writer = new ReleaseNotesWriter();
    release_notes = ctrl_Generator.release_notes;
    
    static process = function() {
        release_notes_writer.write_file(release_notes);
        return new EndState("Documentation written successfully!", c_lime);
    }
    
    static get_message = function() {
        return "Writing release notes...";
    }
}
