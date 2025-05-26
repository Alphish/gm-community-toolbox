[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Function utilities](/Docs/Reference/Groups/FunctionUtils.md) > [Static initialization](/Docs/Reference/Groups/FunctionUtils_Static.md)

# static_init

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFunction/utils_CommunityToolboxFunction.gml#L83)

Runs a given function in order to initialize its static values, then returns that function's static struct.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **function** | **`Function`** | **Required** | The function to initialize the static variables of. |

###### Returns
**`Struct`**

### Example

The following code initializes the static variables of a LevelGrid constructor:

```gml
function LevelGrid(_name, _width, _height) constructor {
    static load = function(_filename) {
        var _json = json_load(_filename);
        if (!is_struct(_json))
            return undefined;
        
        var _grid = new LevelGrid(_json.name, _json.width, _json.height);
        _grid.cells = string_to_char_array(_json.terrain);
    }
    
    // prevent running instance logic when initializing statics
    if (static_init_in_progress()) exit;
    
    name = _name;
    width = _width;
    height = _height;
    cells = array_create(width * height, ".");
}

// initialize the LevelGrid statics
static_init(LevelGrid);
```

Thanks to the `static_init` call, `LevelGrid.load(...)` function can be used without directly creating any LevelGrid instance, which would be necessary otherwise.

### Update history

- **24.6.0** - Created a function to initialize static variables of other functions.
