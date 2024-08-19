/// @func ReferenceMergingState()
/// @desc A state for merging the data from Community Toolbox project and Docs Generator reference items.
function ReferenceMergingState() : AppState() constructor {
    reference_merger = new ReferenceMerger(ctrl_Generator.docs_toc, ctrl_Generator.toolbox_project);
    
    static process = function() {
        reference_merger.run_next_step();
        if (!reference_merger.is_completed)
            return self;
        
        if (reference_merger.is_failed)
            return new EndState("Problems found when merging project data with reference stubs.", c_red);
        
        ctrl_Generator.reference_items = reference_merger.result;
        return new ReleaseAssemblingState();
    }
    
    static get_message = function() {
        return "Merging project and reference files data...";
    }
}
