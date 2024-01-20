/// @func ReferenceWritingState()
/// @desc A state for writing the documentation data on the drive.
function ReferenceWritingState() : AppState() constructor {
    generator = new ReferenceFilesGenerator(ctrl_Generator.reference_items);
    
    static process = function() {
        generator.run_next_step();
        if (!generator.is_completed)
            return self;
        
        return new EndState("Reference files written successfully!", c_lime);
    }
    
    static get_message = function() {
        return $"Writing reference, files written: {generator.processed_count}/{generator.total_count}";
    }
}
