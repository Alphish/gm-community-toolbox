text = "";
insert_position = 0;
keyboard_string = ""; // clean up the keyboard_string from earlier

focus_blend = c_white;
hover_blend = c_silver;
basic_blend = c_gray;

// handling the underscore "blinking" at the current input position
blink = 0;
blink_max = 40;

// handling repeated inputs by holding down specific keys
// so if you hold down a key long enough, it's as if you press it repeatedly
// it mirrors similar repetition for letters/digits/etc.
// as hanled by keyboard_string

repeatable_keys = [vk_left, vk_right, vk_backspace, vk_delete];
repeatable_count = array_length(repeatable_keys);

repeat_key = undefined;
repeat_time = 0;
repeat_delay = 15; // the number of frames after which repetition should be detected
repeat_period = 3; // the number of frames between subsequent input repetitions

image_index = 0;
image_speed = 0;

// updates the state of the repeated inputs
check_repeats = function() {
    // if any new repeated input key is pressed
    // it becaomes the new repetition target
    for (var i = 0; i < repeatable_count; i++) {
        if (keyboard_check_pressed(repeatable_keys[i])) {
            repeat_key = repeatable_keys[i];
            repeat_time = 0;
            return;
        }
    }
    
    if (is_undefined(repeat_key))
        return;
    
    if (keyboard_check(repeat_key)) {
        // keep increasing the repeat timer while holding down the key
        repeat_time++;
    } else {
        // while the key is no longer held down, stop the repetition
        repeat_key = undefined;
        repeat_time = 0;
    }
}

// checks whether an input repetition is made for the given key
// in the current frame
is_repeated = function(_key) {
    if (repeat_key != _key)
        return false; // the key isn't a target of repetition
    else if (repeat_time == 0)
        return true; // the key has just been pressed
    else if (repeat_time < repeat_delay)
        return false; // waiting for start of repetition
    else
        return (repeat_time - repeat_delay) mod repeat_period == 0; // performing repetition every X frames
}

update_source = function() {
    if (!is_defined(text_source))
        return;
    
    if (!input_format.can_parse(text))
        return;
    
    var _value = input_format.parse(text);
    if (is_defined(setter_property) && setter_property != "")
        text_source[$ setter_property](_value);
    else
        text_source[$ text_property] = _value;
    
    text = input_format.format(text_source[$ text_property]);
}
