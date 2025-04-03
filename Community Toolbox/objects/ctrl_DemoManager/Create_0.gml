randomize();

// -------------
// Methods setup
// -------------

demo_categories = [];

define_category = function(_title) {
    var _result = {
        title: _title,
        demos: [],
        index: array_length(demo_categories),
        define_demo: function(_title, _room, _description = undefined) {
            var _category = self;
            array_push(demos, {
                category: _category,
                title: _title,
                target_room: _room,
                description: _description
            });
        },
        show_demos: function() {
            instance_destroy(ui_DemoButton);
            array_foreach(demos, function (_demo, i) {
                instance_create_layer(ctrl_DemoManager.x, ctrl_DemoManager.y + i * 96, "Instances", ui_DemoButton, {
                    category: _demo.category,
                    title: _demo.title,
                    description: _demo.description,
                    target_room: _demo.target_room
                });
            });
        }
    };
    array_push(demo_categories, _result);
    return _result;
}

// -----------------
// Demos definitions
// -----------------

with (define_category("Maths")) {
    define_demo("Euclidean division", demo_EuclideanDivision, "Showcasing functions for calculating Euclidean quotient and remainder, properly cycling between negative and positive values.");
    define_demo("Reaching targets", demo_ReachingTargets, "Showcasing functions for calculating values closer to the target by a certain step or amount.");
    define_demo("Unlerp/relerp", demo_UnlerpRelerp, "Showcasing functions for extracting values in relation to ranges and remapping them to other ranges.");
}

with (define_category("Strings")) {
    define_demo("Various string utilities", demo_StringUtilities);
}

with (define_category("Arrays")) {
    define_demo("Various array utilities", demo_ArrayUtilities);
    define_demo("Pushing/inserting arrays", demo_ArrayTransfer, "Showcasing functions for pushing and inserting entire arrays into other arrays.");
    define_demo("DS List <-> Array conversions", demo_DsListArrayConversion, "Showcasing functions for copying/adding data between arrays and DS lists.");
}

with (define_category("Structs")) {
    define_demo("Struct assignment", demo_StructAssign, "Showcasing a function that sets values from one struct to another struct.");
}

with (define_category("Collisions")) {
    define_demo("Array-based collisions", demo_ShapesCollision, "Showcasing array-based counterparts to built-in collision functions that populate DS lists.");
    define_demo("Topmost instance", demo_TopHover, "Showcasing a function finding the topmost/least depth instance at the given point.");
}

with (define_category("Graphics")) {
    define_demo("Drawing setup", demo_DrawingUtilities, "Showcasing functions grouping drawing configurations frequently occurring together.");
    define_demo("Arc shapes", demo_DrawingShapes, "Showcasing functions for drawing arcs, circle segments, circle sectors and rings.");
    define_demo("Shader utilities", demo_ShaderUtilities);
}

with (define_category("Files")) {
    define_demo("Text saving/loading", demo_FileUtilities, "Showcasing functions for loading text files as strings and saving strings as text files.");
    define_demo("JSON saving/loading", demo_JsonUtilities, "Showcasing functions for loading JSON files into values and saving values as JSON files.");
}

with (define_category("Miscellaneous")) {
    define_demo("Nullish checks", demo_NullishCheck, "Showcasing functions for checking if values are nullish (null/undefined) or not.");
}
