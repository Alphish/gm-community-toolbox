selected_layer = "Sprites";

destroy_instances = function() {
    layer_destroy_instances(selected_layer);
}

destroy_sprites = function() {
    layer_destroy_sprites(selected_layer);
}

destroy_text = function() {
    layer_destroy_text(selected_layer);
}

destroy_sequences = function() {
    layer_destroy_sequences(selected_layer);
}

destroy_backgrounds = function() {
    layer_destroy_backgrounds(selected_layer);
}

destroy_tilemaps = function() {
    layer_destroy_tilemaps(selected_layer);
}
