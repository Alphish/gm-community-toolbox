// string_contains

contains_haystack = "Haystack";
contains_needle = "Needle";
contains_result = string_contains(contains_haystack, contains_needle) ? "Needle IS in haystack" : "Needle NOT in haystack";

// string_to_char_array

char_array_result = "Click on a string_to_char_array button to see the array..."

do_string_to_char_array_0 = function() {
    char_array_result = string(string_to_char_array(ui_StringText.text));
}

do_string_to_char_array_1 = function() {
    char_array_result = string(string_to_char_array(ui_StringText.text, true));
}
