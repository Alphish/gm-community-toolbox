@region <Misc:Static initialization> Static initialization

@func <static_init>

@section Example

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

@update 24.6.0
Created a function to initialize static variables of other functions.

@func <static_init_in_progress>

@section Example

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

Thanks to the `static_init_in_progress` check no instance logic is executed, avoiding potential troubles with undefined width and height and the like.

@update 24.6.0
Created a function to check if static variables initialization is in progress, in order to skip the non-static logic.
