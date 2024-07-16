/// @func ReferenceWritingState()
/// @desc A state for writing function reference files.
function ReferenceWritingState() : AppState() constructor {
    generator = new ReferenceFilesGenerator(ctrl_Generator.reference_items);
    
    static process = function() {
        generator.run_next_step();
        if (!generator.is_completed)
            return self;
        
        return new ReleaseNotesWritingState();
    }
    
    static get_message = function() {
        return $"Writing reference, files written: {generator.processed_count}/{generator.total_count}";
    }
}
