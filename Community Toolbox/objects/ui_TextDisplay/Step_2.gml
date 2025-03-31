if (is_defined(text_source)) {
    var _property = text_source[$ text_property];
    
    if (is_method(_property))
        _property = _property();
    
    if (typeof(_property) == "bool")
        _property = _property ? "true" : "false";
    
    if (is_undefined(_property))
        _property = "undefined";
    
    text = string(_property);
}
