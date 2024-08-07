/// @func ReleaseAssemblingState()
/// @desc A state for merging the data from Community Toolbox project and Docs Generator reference items.
function ReleaseAssemblingState() : AppState() constructor {
    release_assembler = new ReleaseNotesAssembler(ctrl_Generator.docs_toc, ctrl_Generator.reference_items);
    
    static process = function() {
        release_assembler.run_next_step();
        if (!release_assembler.is_completed)
            return self;
        
        if (release_assembler.is_failed)
            return new EndState("Problems found when assembling release notes.", c_red);
        
        ctrl_Generator.release_notes = release_assembler.result;
        return new ReferenceWritingState();
    }
    
    static get_message = function() {
        return "Assembling release notes...";
    }
}
