event_inherited();

key_width = collection_editor.key_field_width;

collection_item = collection_editor.collection[$ collection_key];

set_collection_key = function(_value) {
    if (_value == collection_key)
        return;
    
    collection_editor.remove_key(collection_key);
    collection_key = _value;
    collection_editor.collection[$ collection_key] = collection_item;
    collection_editor.synchronize();
    collection_editor.on_collection_change();
}

set_collection_item = function(_value) {
    collection_item = _value;
    collection_editor.collection[$ collection_key] = _value;
    collection_editor.on_collection_change();
}

key_text_box = instance_create_depth(x, y, depth - 1, ui_ItemTextBox, {
    text_source: id,
    text_property: nameof(collection_key),
    image_xscale: key_width / 32,
    image_yscale: height / 32,
    input_format: StringInputFormat.non_empty,
});

item_text_box = instance_create_depth(x + key_width, y, depth - 1, ui_ItemTextBox, {
    text_source: id,
    text_property: nameof(collection_item),
    image_xscale: (width - key_width)/ 32,
    image_yscale: height / 32,
    input_format: collection_editor.input_format,
});
