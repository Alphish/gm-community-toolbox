@script <String> String utilities

@func <string_contains>

@section Example

The following example checks for an existence of a cuss word in the player name, and logs a message if one is found.

```gml
var _player_name = "Noname";
if (string_contains(_player_name, "cuss")) {
    show_debug_message("Indecent name entered! Please select another one...");
}
```

@update 24.6.0
Created a function to check whether a given string contains the given substring.

@func <string_to_char_array>

Creates an array of characters from a given string.

@section Details

`string_to_char_array` creates an array of individual characters found in the string, as if retrieved via `string_char_at` built-in function. Because built-in array functions are 0-indexed and string functions are 1-indexed, an optional argument `oneindexed` decides whether the array of characters starts at zero (but then the indices are off by 1 in relation to string functions) or one (in such case an extra undefined value is put at the 0th index).

The function can be used for quicker character-by-character processing of strings, for example in file parsers. With the way strings are encoded in GameMaker runtime, `string_char_at` and many other string functions get slower the further section of the string is referenced. That's because different string characters may be encoded with different number of bytes, so e.g. `string_char_at(100)` can't determine the 100th character without scanning through earlier 99 characters. Thus, reading string characters one-by-one via `string_char_at` or similar method will become proportionally much slower the longer the string is.

In contrast, `string_to_char_array` uses `string_foreach` under the hood, which processes the entire string character-by-character in one go, with processing time roughly proportional to the string length. In fact, `string_foreach` can be a preferable alternative if you don't need to process individual characters in the context of earlier or later ones. In contrast, `string_to_char_array` requires more initial setup and a memory to store the characters, but after that allows you to freely check characters and their surroundings. Either way, if an individual string gets thousands characters long or even longer, it's worth considering using `string_foreach` or `string_to_char_array` over regular string processing functions.

@section Example 1: Basic usage

The following code implements a simple calculator operating on single digit numbers, with operators and digits alternating. Because of alternating operators and digits, it's more practical to use an array of characters than `string_foreach`.

```gml
function calculate_string(_str) {
    var _chars = string_to_char_array(_str);
    var _left = real(_chars[0]);
    var _length = array_length(_chars);
    for (var i = 1; i < _length; i+=2) {
        var _operator = _chars[i];
        var _right = _chars[i+1];
        
        var _next = calculate_operation(_left, _operator, _right);
        show_debug_message($"{_left} {_operator} {_right} = {_next}");
        _left = _next;
    }
    return _left;
}

function calculate_operation(_left, _operator, _right) {
    switch (_operator) {
        case "+":
            return _left + _right;
        case "-":
            return _left - _right;
        case "*":
            return _left * _right;
        case "/":
            return _left div _right;
        case "%":
            return _left mod _right;
    }
}

var _result = calculate_string("3+6*2%7-8/2");
show_debug_message($"Final result: {_result}");
```

@section Example 2: Performance comparison

The following code compares performance of processing individual characters via `string_char_at` and `string_to_char_array`:

```gml
for (var _repeats = 20; _repeats <= 20_000; _repeats *= 10) {
    var _test_string = string_repeat("Hello", _repeats);
    var _length = string_length(_test_string);
    var _current = "";

    var _charat_start = get_timer();
    for (var i = 1; i <= _length; i++) {
        _current = string_char_at(_test_string, i);
    }
    var _charat_end = get_timer();
    var _charat_elapsed = string_format((_charat_end - _charat_start) / 1000, 1, 3);
    show_debug_message($"string_char_at processing through {_length} characters: {_charat_elapsed}ms");

    var _array_start = get_timer();
    var _array = string_to_char_array(_test_string, /* oneindexed */ true);
    for (var i = 1; i <= _length; i++) {
        _current = _array[i];
    }
    var _array_end = get_timer();
    var _array_elapsed = string_format((_array_end - _array_start) / 1000, 1, 3);
    show_debug_message($"string_to_char_array processing through {_length} characters: {_array_elapsed}ms");
}
```

Example output produced by the code above (exact values may vary between computers):

```
string_char_at processing through 100 characters: 0.025ms
string_to_char_array processing through 100 characters: 0.044ms
string_char_at processing through 1000 characters: 0.395ms
string_to_char_array processing through 1000 characters: 0.300ms
string_char_at processing through 10000 characters: 22.627ms
string_to_char_array processing through 10000 characters: 3.464ms
string_char_at processing through 100000 characters: 2158.981ms
string_to_char_array processing through 100000 characters: 30.385ms
```

@update 23.4.1
Tweaked the JSDocs.

@update 23.4.0
Created a function to convert a string to an array of its characters.

@func <string_interpolate>

Creates a new string from a given template, replacing placeholders between curly braces with corresponding values. By default, placeholders are treated as struct keys to replace with corresponding struct values. Placeholder processing can be customised with an optional evaluator, taking the given values and placeholder text as arguments and returning the value to replace the placeholder with.

@section Details

`string_interpolate` in its basic form is a struct counterpart to `string` and `string_ext` functions. Whereas `string_ext` uses a template with numeric placeholders and finds values in an array, `string_interpolate` uses a tempalate with string placeholders and finds values in a struct. For example, `string_ext("Name: {0}, LV: {1}", ["Bob", 12])` produces the same result as `string_interpolate("Name: {name}, LV: {level}", { name: "Bob", level: 12 })`

This format makes `string_interpolate` similar to template strings, as described in the [GameMaker manual page about strings](https://manual.gamemaker.io/monthly/en/#t=GameMaker_Language%2FGML_Reference%2FStrings%2FStrings.htm). Template strings are more powerful, in that they can contain and evaluate an arbitrary GML expression out of the box. On the other hand, the templates for `string_interpolate` can be stored and replaced externally, which is useful e.g. for supporting different languages.

If the template needs to use curly braces verbatim, one may use double braces to replace them. Each pair of repeated braces counts as a single brace - e.g. four closing braces in a row will be replaced with two closing braces, six opening braces in a row will be replaced with three opening braces, and so on. Also, placeholders cannot contain curly braces. For example, a template of `"{outer{inner}outer}"` will attempt to replace only `{inner}` (with "inner" as placeholder content), as opposed to `{outer{inner}` or `{outer{inner}outer}`

When simply replacing placeholders with corresponding struct values isn't enough, one may use a custom evaluator function, accepting values as the first argument and placeholder text as the second. A custom evaluator may be used e.g. to make searching for struct values case-insensitive, handle formatting specifiers (e.g. `"{month:2}"` would be padded up to two digits), evaluate simple expressions and so on.

@section Example 1: Basic usage

The following code retrieves a language-specific template (or uses a fallback one) to produce a text to display.

```gml
var _template = dictionary_get_string(global.language, "player_stats") ?? "{player} | LV: {level} | HP: {hp}/{hp_max} | MP: {mp}/{mp_max}";
stats_text = string_interpolate(_template, global.player_data); // example output: "Bob | LV: 12 | HP: 345/345 | MP: 67/89"
```

@section Example 2: Custom evaluator

The following code uses a custom evaluator to replace a placeholder with a direct struct value or a getter call.

```gml
var _text = string_interpolate(_template, global.game_data, function(_values, _placeholder) {
    if (struct_exists(_values, _placeholder))
        return struct_get(_values, _placeholder);
    else if (struct_exists(_values, "get_" + _placeholder))
        return struct_get(_values, "get_" + _placeholder)();
    else
        return undefined;
});
```

@update 24.11.0
Created a function to replace placeholders with struct values in a string template.
