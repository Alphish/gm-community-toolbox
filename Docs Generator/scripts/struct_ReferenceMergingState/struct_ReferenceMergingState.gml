/// @func ReferenceMergingState()
/// @desc A state for merging the data from Community Toolbox project and Docs Generator reference items.
function ReferenceMergingState() : AppState() constructor {
    reference_merger = new ReferenceMerger(ctrl_Generator.toc_home, ctrl_Generator.toolbox_project);
    
    static process = function() {
        reference_merger.run_to_end();
        if (reference_merger.is_failed)
            return new EndState("Problems found when merging project data with reference stubs.", c_red);
        
        ctrl_Generator.reference_items = reference_merger.result;
        return new ReferenceWritingState();
    }
    
    static get_message = function() {
        return "Merging project and reference files data...";
    }
}
