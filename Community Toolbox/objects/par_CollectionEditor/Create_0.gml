margin_left = 8;
margin_right = 8;
margin_top = 40;
margin_bottom = 8;

item_controls = [];
max_items = (sprite_height - margin_top - margin_bottom) div item_height;
item_from = 0;
item_to = 0;
keys_count = 0;

on_collection_change ??= function() {};

if (is_undefined(collection))
    throw $"The source collection for {object_get_name(object_index)} is undefined.";

add_button = instance_create_depth(
    x + sprite_width - margin_right, y + 4, depth - 1, ui_CollectionAdd,
    { collection_editor: id }
    );

event_user(0);
synchronize();

