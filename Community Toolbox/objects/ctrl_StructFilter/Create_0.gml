result = {};

source = {
    title: "Bananaloosa",
    rank: "#154",
    xPublisher: "FruitWorks",
    xBlurb: "Shoot the banana!",
};

filter_by_key = function() {
    set_result(struct_filter(source, function(_key, _value) {
        return string_lower(_key) == _key;
    }));
}

filter_by_value = function() {
    set_result(struct_filter(source, function(_key, _value) {
        return string_letters(_value) == _value;
    }));
}

filter_by_key_value = function() {
    set_result(struct_filter(source, function(_key, _value) {
        return string_lower(_key) == _key && string_letters(_value) == _value;
    }));
}

set_result = function(_result) {
    with (ui_StructEditor) {
        if (collection != other.result)
            continue;
        
        collection = _result;
        synchronize();
    }
    result = _result;
}
