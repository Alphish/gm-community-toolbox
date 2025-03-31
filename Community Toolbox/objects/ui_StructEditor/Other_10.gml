// Inherit the parent event
event_inherited();

add_new_item = function() {
    var _key = default_key;
    while (struct_exists(collection, _key)) {
        _key += "_";
    }
    
    struct_set(collection, _key, default_item);
}

remove_key = function(_key) {
    return struct_remove(collection, _key);
}

enumerate_keys = function() {
    var _keys = struct_get_names(collection);
    array_sort(_keys, true);
    return _keys;
}
