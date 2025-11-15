array_foreach(demo_categories, function(_category, i) {
    instance_create_layer(0, y + i * 64, layer, ui_Button, {
        image_xscale: 8,
        image_yscale: 2,
        text: _category.title,
        on_click: method(_category, _category.show_demos)
    });
});

if (!variable_global_exists("last_category_index"))
    global.last_category_index = 0;

demo_categories[global.last_category_index].show_demos();
