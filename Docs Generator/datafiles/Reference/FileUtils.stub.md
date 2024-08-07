@script <File> File utilities

@func <file_read_all_text>

@section Example

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

@update 23.4.0
Created a function to read file contents as a string.

@func <file_write_all_text>

@section Example

The following code shows a function to save a simple save file with the number of levels completed.

```gml
function progress_save() {
    var _save_content = string(global.levels_completed);
    file_write_all_text("save.dat", _save_content);
}
```

@update 23.4.0
Created a function to replace file contents with a given string.
