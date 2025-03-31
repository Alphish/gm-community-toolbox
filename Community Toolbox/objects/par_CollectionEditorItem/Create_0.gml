remove = function() {
    collection_editor.remove_item_control(id);
}

remove_button = instance_create_depth(x + width, y, depth - 1, ui_CollectionRemove, { item_control: id });
width -= remove_button.sprite_width;
remove_button.y += (height - remove_button.sprite_height) div 2;
