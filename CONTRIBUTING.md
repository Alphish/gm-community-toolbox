# General Information

## Behavioural Guidelines

- As an affiliated project, **all [general community guidelines of the GameMaker Community](https://forum.gamemaker.io/index.php?threads/community-guidelines.4/) also apply here.**
- **Before starting development on an accepted feature, reply to its Issue thread indicating your commitment.** This prevents multiple developers from duplicating each other's work.
- As much as possible, keep your changes restricted to the contribution that you plan to make. Avoid making unrelated changes in other parts of the project.
- Avoid force-pushing except for rebasing ahead of a merge.

## IDE Setup

- **Use the stable IDE version indicated by `IDEVersion` in [the main YYP file on the `main` branch](https://github.com/Alphish/gm-community-toolbox/blob/main/Community%20Toolbox/Community%20Toolbox.yyp).** This will prevent IDE version differences from causing merge conflicts.
- **Use 4 spaces for indentation.** This can be configured in *Preferences > Text Editors > Code Editor > Tab size*. Be sure to uncheck *Keep tabs*.
- **If you use Feather, set GM1042 and GM2017 to *Ignore*.** This can be configured in *Preferences > Feather Settings > Message Severity*.

# Style Guide

## JSDoc/Feather Comments

- For JSDoc comments, use a triple-slash convention rather than multiline comment convention.

**YES:**

```gml
/// @func some_func()
/// @desc Some function.
/// @returns {Boolean}
```

**NO:**

```gml
/**
 * @func some_func()
 * @desc Some function.
 * @returns {Boolean}
 */
```

- Order the annotations in this order: `@func`, `@desc`, `@arg`, `@returns`
- In the `@func` annotation, keep arguments all lowercase (without word separation) and separated by comma without any space inbetween.
- In the `@arg` annotation, specify expected type using PascalCase conventions, so `String` or `Asset.GMObject` rather than `string` or `asset.gmobject`. The name of the argument is the same as in the `@func` annotation.
- Wrap optional argument names in square brackets in both the `@func` and `@arg` annotations; e.g. `[precision]`
- In the `@returns` annotation, specify type using PascalCase just like in the arguments.

**YES:**

```gml
/// @func string_to_char_array(str,[ondeindexed])
/// @desc Creates an array of characters from a given string. It may be 0-indexed or 1-indexed.
/// @arg {String} str           The string to convert to the array.
/// @arg {Bool} [oneindexed]    Whether the first character should start at index of 0 (false) or index of 1 (true).
/// @returns {Array<String>}
```

**NO:**

```gml
/// @func string_to_char_array(str, ondeindexed)
/// @returns {array<string>}
/// @arg {string} str           The string to convert to the array.
/// @arg {bool} oneindexed      Whether the first character should start at index of 0 (false) or index of 1 (true).
/// @desc Creates an array of characters from a given string. It may be 0-indexed or 1-indexed.
```

## Naming Conventions

### Function Names

- **Use `snake_case` for all function names.**
- **Functions that perform some action should be phrased like commands.** Examples:
	- `do_the_thing(...)`
	- `calculate_some_result(...)`
- **Functions that perform some checks should be phrased like questions.** Examples:
	- `is_defined(...)`
	- `has_items(...)`
	- `can_move(...)`
- Functions that share a domain with built-in functions should adopt the same prefix as them whenever possible so that they are easier to find. Examples:
	- `file_read_all_text(...)`
	- `draw_arc(...)`
- Functions that expand upon some built-in functionality of GameMaker should use naming similar to the original domain. Example: an array-based counterpart to `collision_circle_list` would be called `collision_circle_array`.
- When making a toolbox function similar to some industry standard, it's worth checking the commonly accepted naming scheme. Since GML borrows lots of naming conventions from JavaScript, JavaScript conventions will take precedence over other languages in case of multiple competing conventions.
- Functions using these keywords in their names should have these expected behaviours:
    - `get`: The function will return a result without modifying anything (except maybe local variables to obtain some result).
    - `set`: When "set" is understood as an operation rather than a collection of items, the function is expected to change some variable and is unlikely to return a result.
    - `load`: The function will read something from a file.
    - `save`: The function will write/overwrite some file with a given content.
    - `parse`: The function will read some value from a string.
- Matching the GML conventions, functions that have `color` in name should also have `colour` counterpart, e.g. `shader_set_uniform_color` and `shader_set_uniform_colour`. The name of the colour argument (if any) should match the function's spelling.

### Function Parameters and Local Variables

- **Prepend an underscore (`_`) to the names of local variables**, in order to avoid collisions with keywords and instance/struct variables.

**YES:**

```gml
function relerp(_oldfrom, _oldto, _oldvalue, _newfrom, _newto) {
    if (_oldto == _oldfrom) {
        throw "relerp() old range has zero width.";
    }
    var _amount = (_oldvalue - _oldfrom) / (_oldto - _oldfrom);
    return _newfrom + (_newto - _newfrom) * _amount;
}
```

**NO:**

```gml
function relerp(oldfrom, oldto, oldvalue, newfrom, newto) {
    if (oldto == oldfrom) {
        throw "relerp() old range has zero width.";
    }
    var amount = (oldvalue - oldfrom) / (oldto - oldfrom);
    return newfrom + (newto - newfrom) * amount;
}
```

### Toolbox Script Assets

- **Use `utils_` as the prefix, and PascalCase for the rest of the name.** Example: `utils_CommunityToolboxScriptCategory`

### Other assets

- **Use lowercase+underscore asset type prefixes (e.g. `spr_`, `obj_`, `rm_`), followed by PascalCase for the rest of the name.** Example: `rm_Home`

## Code Style

### Identations

- **Use 4 space characters for an indentation level, without tab characters.**

### Braces

**Use [K&R bracing style](https://en.wikipedia.org/wiki/Indentation_style#K&R_style):**

- Opening code block braces are in the same line as block definition (including functions)
- Closing braces are in their own line, at the same identation level as the original block-starting expression.
- Prefer using braces whenever applicable, even for one-liners.

Example:

```gml
function some_function(_arg1, _arg2, _arg3) {
    var _some_arg = 123;
    if (_arg1 == _arg2) {
        // do some thing
    } else if (_arg1 == _arg3) {
        // do other thing
    } else {
        // do yet another thing
    }
}
```

- If braces are omitted in an `if` block, putting the condition in the first line and the body of the `if` in the second line.

```gml
function other_function(_arg1) {
    if (is_undefined(_arg1))
        return undefined;

    // do the rest
}
```

- If there's an `if`-`else` block, then the braces should be consistently applied or consistently omitted.

**YES:**

```gml
if (_some_condition)
    return 1;
else if (_other_condition)
    return 2;
else
    return 3;
```

**YES:**

```gml
if (_some_condition) {
    return 1;
} else if (_other_condition) {
    return 2;
} else {
    return 3;
}
```

**NO:**

```gml
if (_some_condition)
    return 1;
else if (_other_condition)
    return 2;
else {
    show_debug_message("Hello, world!");
    return 3;
}
```

- Two separate `if` blocks (not part of the same `if`/`else` ladder) must be at least one line apart.

**YES:**

```gml
if (_some_condition)
    show_debug_message("AAA");

if (_other_condition)
    show_debug_message("BBB");
```

**YES:** (same `if`/`else` ladder)

```gml
if (_some_condition)
    show_debug_message("AAA");
else if (_other_condition)
    show_debug_message("BBB");
```

**NO:** (not the same `if`/`else` ladder)

```gml
if (_some_condition)
    show_debug_message("AAA");
if (_other_condition)
    show_debug_message("BBB");
```

### Semicolons

- **Always put a semicolon after regular statements.**

**YES:**

```gml
//OK
show_debug_message("Hello, world!");
```

**YES:**

```gml
var _best_students = array_filter(_students, function(_student) {
    return _student.grade >= 4.5;
});
```

**NO:**
```gml
show_debug_message("Hello, world!")
```

- Do not put a semicolon right after a closing brace, whether related to a block like `if`, `for`, or a method.

**YES:**

```gml
some_method = function() {
    show_debug_message("Test method");
}
```

**NO:**

```gml
some_method = function() {
    show_debug_message("Test method");
};
```

