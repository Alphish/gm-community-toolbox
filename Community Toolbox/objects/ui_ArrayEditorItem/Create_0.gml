event_inherited();

collection_item = collection_editor.collection[collection_key];

set_collection_item = function(_value) {
    collection_item = _value;
    collection_editor.collection[collection_key] = _value;
    collection_editor.on_collection_change();
}

item_text_box = instance_create_depth(x, y, depth - 1, ui_ItemTextBox, {
    text_source: id,
    text_property: nameof(collection_item),
    image_xscale: width / 32,
    image_yscale: height / 32,
    input_format: collection_editor.input_format,
});
