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
