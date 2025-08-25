[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [String utilities](/Docs/Reference/Groups/StringUtils.md)

# string_interpolate

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxString/utils_CommunityToolboxString.gml#L34)

Creates a new string from a given template, replacing placeholders between curly braces with corresponding values. By default, placeholders are treated as struct keys to replace with corresponding struct values. Placeholder processing can be customised with an optional evaluator, taking the given values and placeholder text as arguments and returning the value to replace the placeholder with.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **template** | **`String`** | **Required** | The template to replace placeholders in. |
| **values** | **`Any`** | **Required** | The source of values for evaluating placeholders. |
| **evaluator** | **`Function`** | Default: `struct_get` | A function returning the placeholder replacement based on given values and placeholder text. |

###### Returns
**`String`**

### Details

`string_interpolate` in its basic form is a struct counterpart to `string` and `string_ext` functions. Whereas `string_ext` uses a template with numeric placeholders and finds values in an array, `string_interpolate` uses a tempalate with string placeholders and finds values in a struct. For example, `string_ext("Name: {0}, LV: {1}", ["Bob", 12])` produces the same result as `string_interpolate("Name: {name}, LV: {level}", { name: "Bob", level: 12 })`

This format makes `string_interpolate` similar to template strings, as described in the [GameMaker manual page about strings](https://manual.gamemaker.io/monthly/en/#t=GameMaker_Language%2FGML_Reference%2FStrings%2FStrings.htm). Template strings are more powerful, in that they can contain and evaluate an arbitrary GML expression out of the box. On the other hand, the templates for `string_interpolate` can be stored and replaced externally, which is useful e.g. for supporting different languages.

If the template needs to use curly braces verbatim, one may use double braces to replace them. Each pair of repeated braces counts as a single brace - e.g. four closing braces in a row will be replaced with two closing braces, six opening braces in a row will be replaced with three opening braces, and so on. Also, placeholders cannot contain curly braces. For example, a template of `"{outer{inner}outer}"` will attempt to replace only `{inner}` (with "inner" as placeholder content), as opposed to `{outer{inner}` or `{outer{inner}outer}`

When simply replacing placeholders with corresponding struct values isn't enough, one may use a custom evaluator function, accepting values as the first argument and placeholder text as the second. A custom evaluator may be used e.g. to make searching for struct values case-insensitive, handle formatting specifiers (e.g. `"{month:2}` would be padded up to two digits), evaluate simple expressions and so on.

### Example 1: Basic usage

The following code retrieves a language-specific template (or uses a fallback one) to produce a text to display.

```gml
var _template = dictionary_get_string(global.language, "player_stats") ?? "{player} | LV: {level} | HP: {hp}/{hp_max} | MP: {mp}/{mp_max}";
stats_text = string_interpolate(_template, global.player_data); // example output: "Bob | LV: 12 | HP: 345/345 | MP: 67/89"
```

### Example 2: Custom evaluator

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

### Update history

- **24.11.0** - Created a function to replace placeholders with struct values in a string template.
