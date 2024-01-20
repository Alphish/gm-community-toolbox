/// @func ReferenceFilesGenerator(items)
/// @desc A tool for writing files for each reference item given.
/// @arg {Array<Struct.ReferenceItem>} items        The items to write the reference pages for.
function ReferenceFilesGenerator(_items) : MultiStepProcess() constructor {
    items = _items;
    remaining_items = variable_clone(_items, 1);
    
    processed_count = 0;
    total_count = array_length(remaining_items);
    
    static perform_step = function() {
        var _item = array_shift(remaining_items);
        var _writer = create_item_writer(_item);
        _writer.write_item(_item);
        
        processed_count++;
        return processed_count >= total_count;
    }
    
    static create_item_writer = function(_item) {
        switch (_item.type) {
            case "home":
                return new ReferenceHomeWriter();
            case "script":
                return new ReferenceScriptWriter();
            case "region":
                return new ReferenceRegionWriter();
            case "func":
                return new ReferenceFunctionWriter();
        }
    }
}
