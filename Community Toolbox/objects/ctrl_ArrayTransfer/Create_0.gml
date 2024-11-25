destination = [];
destination_string = "";
source = [];
source_string = "";

destination_clear = function() {
    array_clear(destination);
}

source_clear = function() {
    array_clear(source);
}

source_insert = function() {
    array_insert_ext(destination, 0, source);
}

source_push = function() {
    array_push_ext(destination, source);
}

source_add = function(_item) {
    array_push(source, _item);
}
