// Inherit the parent event
event_inherited();

add_new_item = function() {
    array_push(collection, default_item);
}

remove_key = function(_key) {
    return array_delete(collection, _key, 1);
}

enumerate_keys = function() {
    return array_create_ext(array_length(collection), function(i) { return i; });
}
