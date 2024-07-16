[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [File utilities](/Docs/Reference/Groups/FileUtils.md)

# file_write_all_text

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFile/utils_CommunityToolboxFile.gml#L22)

Creates or overwrites a given file with the given string content.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **filename** | **`String`** | **Required** | The path of the file to create/overwrite. |
| **content** | **`String`** | **Required** | The content to create/overwrite the file with. |

###### Returns
N/A

### Example

The following code shows a function to save a simple save file with the number of levels completed.

```gml
function progress_save() {
    var _save_content = string(global.levels_completed);
    file_write_all_text("save.dat", _save_content);
}
```

### Update history

- **23.4.0** - Created a function to replace file contents with a given string.
