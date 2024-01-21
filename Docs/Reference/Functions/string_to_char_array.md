[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [String utilities](/Docs/Reference/Groups/StringUtils.md)

# string_to_char_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxString/utils_CommunityToolboxString.gml#L6)

Creates an array of characters from a given string.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **str** | **`String`** | **Required** | The string to convert to the array. |
| **oneindexed** | **`Bool`** | Default: `false` | Whether the first character should start at index of 0 (false) or index of 1 (true). |

###### Returns
**`Array<String>`**

### Details

`string_to_char_array` creates an array of individual characters found in the string, as if retrieved via `string_char_at` built-in function. Because built-in array functions are 0-indexed and string functions are 1-indexed, an optional argument `oneindexed` decides whether the array of characters starts at zero (but then the indices are off by 1 in relation to string functions) or one (in such case an extra undefined value is put at the 0th index).

The function can be used for quicker character-by-character processing of strings, for example in file parsers. With the way strings are encoded in GameMaker runtime, `string_char_at` and many other string functions get slower the further section of the string is referenced. That's because different string characters may be encoded with different number of bytes, so e.g. `string_char_at(100)` can't determine the 100th character without scanning through earlier 99 characters. Thus, reading string characters one-by-one via `string_char_at` or similar method will become proportionally much slower the longer the string is.

In contrast, `string_to_char_array` uses `string_foreach` under the hood, which processes the entire string character-by-character in one go, with processing time roughly proportional to the string length. In fact, `string_foreach` can be a preferable alternative if you don't need to process individual characters in the context of earlier or later ones. In contrast, `string_to_char_array` requires more initial setup and a memory to store the characters, but after that allows you to freely check characters and their surroundings. Either way, if an individual string gets thousands characters long or even longer, it's worth considering using `string_foreach` or `string_to_char_array` over regular string processing functions.

### Example 1: Basic usage

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

### Example 2: Performance comparison

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
