[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [File utilities](/Docs/Reference/Groups/FileUtils.md)

# file_read_all_text

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFile/utils_CommunityToolboxFile.gml#L5)

Reads entire content of a given file as a string, or returns undefined if the file couldn't be read.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **filename** | **`String`** | **Required** | The path of the file to read the content of. |

###### Returns
**`Undefined,String`**

### Example

The following code shows a function to load the number of levels completed from a simple save file.

```gml
function progress_load() {
    // load string from the save file
    // if the file cannot be loaded, use default "0" string
    var _save_text = file_read_all_text("save.dat") ?? "0";
    
    var _digits = string_digits(_save_text);
    if (_digits == "")
        _digits = "0"; // if the file contained a non-digit string, read 0 as well
    
    global.levels_completed = real(_digits);
}
```

### Update history

- **23.4.1** - Tweaked the JSDocs.
- **23.4.0** - Created a function to read file contents as a string.
