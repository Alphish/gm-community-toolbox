// increasing the blink underscore timer
blink++;
blink = blink mod blink_max;

// handling newly added characters with keyboard_string
if (keyboard_string != "") {
    
    // going through each accumulated character and adding it to the input text
    string_foreach(keyboard_string, function(_character) {
        // for my intents and purposes, I decided to omit non-ASCII characters
        // if you want to support non-ASCII characters, you may remove this condition
        // if (ord(_character) >= 128)
        //     return;
        
        // don't add any new characters if the input string is already long enough
        if (string_length(text) == max_length)
            return;
        
        // append the character to the text
        if (insert_position < string_length(text))
            text = string_insert(_character, text, insert_position + 1);
        else
            text += _character;
        
        insert_position++;
    });
    
    // with all new characters handled, clear the accumulated text
    keyboard_string = "";
}

// updating the state of repeatable keys
check_repeats();

// moving the cursor
if (is_repeated(vk_left))
    insert_position--;
else if (is_repeated(vk_right))
    insert_position++;

insert_position = clamp(insert_position, 0, string_length(text));

// deleting characters via backspace and delete
if (is_repeated(vk_backspace) && insert_position > 0) {
    text = string_delete(text, insert_position, 1);
    insert_position--;
}

if (is_repeated(vk_delete) && insert_position < string_length(text)) {
    text = string_delete(text, insert_position + 1, 1);
}

if (auto_update_source)
    update_source();

if (keyboard_check_pressed(vk_enter)) {
    if (!is_undefined(on_enter))
        on_enter(text);
    
    update_source();
    
    if (is_undefined(text_source))
        text = "";
    
    ctrl_UiManager.keyboard_focus = noone;
}
