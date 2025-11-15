/// @desc Define methods

add_new_item = function() {
    throw $"{object_get_name(object_index)}.add_new_item() is not implemented.";
}

remove_key = function(_key) {
    throw $"{object_get_name(object_index)}.remove_key() is not implemented.";
}

/// @returns {Array}
enumerate_keys = function() {
    throw $"{object_get_name(object_index)}.enumerate_keys() is not implemented.";
}

synchronize = function() {
    // it might have been more efficient to update existing item controls
    // instead of destroying and re-creating them
    // but for a simple demo it should be more than efficient enough
    array_foreach(item_controls, function(_id) { instance_destroy(_id); });
    item_controls = [];
    
    var _keys = enumerate_keys();
    keys_count = array_length(_keys);
    item_from = max(0, min(item_from, keys_count - max_items));
    item_to = min(item_from + max_items, keys_count);
    for (var i = item_from; i < item_to; i++) {
        create_item_control(i - item_from, _keys[i]);
    }
}

add_item_control = function() {
    add_new_item();
    item_from = max(0, keys_count + 1 - max_items);
    synchronize();
    on_collection_change();
}

create_item_control = function(_index, _key) {
    var _xx = x + margin_left;
    var _yy = y + margin_top + item_height * _index;
    var _control = instance_create_depth(_xx, _yy, depth - 1, item_object, {
        collection_editor: id,
        collection_key: _key,
        width: sprite_width - margin_left - margin_right,
        height: item_height,
    });
    array_push(item_controls, _control);
}

remove_item_control = function(_control) {
    remove_key(_control.collection_key);
    synchronize();
    on_collection_change();
}

scroll_up = function() {
    if (item_from <= 0)
        return;
    
    item_from--;
    synchronize();
}

scroll_down = function() {
    if (item_from + max_items >= keys_count)
        return;
    
    item_from++;
    synchronize();
}
