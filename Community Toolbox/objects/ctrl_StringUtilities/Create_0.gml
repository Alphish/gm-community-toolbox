// Action methods

do_string_to_char_array_0 = function() {
    result = string(string_to_char_array(ui_StringText.text));
    last_action = do_string_to_char_array_0;
}

do_string_to_char_array_1 = function() {
    result = string(string_to_char_array(ui_StringText.text, true));
    last_action = do_string_to_char_array_1;
}

// Creating UI controls

instance_create_layer(32, 64, layer, ui_Button, {
    text: "string_to_char_array\n(zero-indexed)",
    on_click: do_string_to_char_array_0,
    image_xscale: 6.5,
    image_yscale: 2,
});

instance_create_layer(32, 160, layer, ui_Button, {
    text: "string_to_char_array\n(one-indexed)",
    on_click: do_string_to_char_array_1,
    image_xscale: 6.5,
    image_yscale: 2,
});

// Setup
last_action = function() {
    result = "";
}
last_step_text = "";
result = "";
