///@desc Setup
red = 255;
green = 255;
blue = 255;
alpha = 1.0;

// Creating UI controls
var colorSliderRange = array_create_ext(256, function(i) {
    return i;
});
var fracSliderRange = array_create_ext(51, function(i) {
    return i/50;
});
instance_create_layer(16, 96, layer, ui_Slider, {
    label: "Red",
    variable_owner: id,
    variable_name: "red",
    values: colorSliderRange,
});
instance_create_layer(16, 145, layer, ui_Slider, {
    label: "Green",
    variable_owner: id,
    variable_name: "green",
    values: colorSliderRange,
});
instance_create_layer(16, 194, layer, ui_Slider, {
    label: "Blue",
    variable_owner: id,
    variable_name: "blue",
    values: colorSliderRange,
});
instance_create_layer(16, 253, layer, ui_Slider, {
    label: "Alpha",
    variable_owner: id,
    variable_name: "alpha",
    values: fracSliderRange,
});
