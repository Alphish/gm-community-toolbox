/// @func layer_destroy_sprites(layer)
/// @desc Destroys all sprite elements from the given layer.
/// @arg {String,Id.Layer} layer        The layer to remove the elements from.
function layer_destroy_sprites(_layer) {
    var _elements = layer_get_all_elements(_layer);
    array_foreach(_elements, function(_element) {
        if (layer_get_element_type(_element) == layerelementtype_sprite)
            layer_sprite_destroy(_element);
    });
}

/// @func layer_destroy_text(layer)
/// @desc Destroys all text elements from the given layer.
/// @arg {String,Id.Layer} layer        The layer to remove the elements from.
function layer_destroy_text(_layer) {
    var _elements = layer_get_all_elements(_layer);
    array_foreach(_elements, function(_element) {
        if (layer_get_element_type(_element) == layerelementtype_text)
            layer_text_destroy(_element);
    });
}

/// @func layer_destroy_sequences(layer)
/// @desc Destroys all sequences from the given layer.
/// @arg {String,Id.Layer} layer        The layer to remove the elements from.
function layer_destroy_sequences(_layer) {
    // it's possible to create multiple sequence elements through code
    // so sequences are removed through a loop as well
    var _elements = layer_get_all_elements(_layer);
    array_foreach(_elements, function(_element) {
        if (layer_get_element_type(_element) == layerelementtype_sequence)
            layer_text_destroy(_element);
    });
}

/// @func layer_destroy_backgrounds(layer)
/// @desc Destroys all backgrounds from the given layer.
/// @arg {String,Id.Layer} layer        The layer to remove the elements from.
function layer_destroy_backgrounds(_layer) {
    // it's possible to create multiple background elements through code
    // so backgrounds are removed through a loop as well
    var _elements = layer_get_all_elements(_layer);
    array_foreach(_elements, function(_element) {
        if (layer_get_element_type(_element) == layerelementtype_background)
            layer_text_destroy(_element);
    });
}

/// @func layer_destroy_tilemaps(layer)
/// @desc Destroys all tilemaps from the given layer.
/// @arg {String,Id.Layer} layer        The layer to remove the elements from.
function layer_destroy_tilemaps(_layer) {
    // it's possible to create multiple tilemap elements through code
    // so tilemaps are removed through a loop as well
    var _elements = layer_get_all_elements(_layer);
    array_foreach(_elements, function(_element) {
        if (layer_get_element_type(_element) == layerelementtype_tilemap)
            layer_text_destroy(_element);
    });
}
