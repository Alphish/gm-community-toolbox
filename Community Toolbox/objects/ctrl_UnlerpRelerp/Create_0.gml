///@desc Setup
unlerp_from = -100;
unlerp_to = 100;
unlerp_value = 0;
unlerp_result = 0;

relerp_oldfrom = -100;
relerp_oldto = 100;
relerp_oldvalue = 0;
relerp_newfrom = -50;
relerp_newto = 50;
relerp_result = 0;

update_results = function() {
    try {
        unlerp_result = unlerp(unlerp_from, unlerp_to, unlerp_value);
    } catch (ex) {
        unlerp_result = ex;
    }
    try {
        relerp_result = relerp(relerp_oldfrom, relerp_oldto, relerp_oldvalue, relerp_newfrom, relerp_newto);
    } catch (ex) {
        relerp_result = ex;
    }
};

update_results();

// Creating UI controls
var sliderRange = array_create_ext(41, function(i) {
    return i*5-100;
});

instance_create_layer(16, 96, layer, ui_UnlerpRelerpSlider, {
    label: "from",
    variable_name: "unlerp_from",
    values: sliderRange,
});
instance_create_layer(16, 145, layer, ui_UnlerpRelerpSlider, {
    label: "to",
    variable_name: "unlerp_to",
    values: sliderRange,
});
instance_create_layer(16, 194, layer, ui_UnlerpRelerpSlider, {
    label: "value",
    variable_name: "unlerp_value",
    values: sliderRange,
});

instance_create_layer(16, 338, layer, ui_UnlerpRelerpSlider, {
    label: "oldfrom",
    variable_name: "relerp_oldfrom",
    values: sliderRange,
});
instance_create_layer(16, 387, layer, ui_UnlerpRelerpSlider, {
    label: "oldto",
    variable_name: "relerp_oldto",
    values: sliderRange,
});
instance_create_layer(16, 438, layer, ui_UnlerpRelerpSlider, {
    label: "oldvalue",
    variable_name: "relerp_oldvalue",
    values: sliderRange,
});

instance_create_layer(640, 338, layer, ui_UnlerpRelerpSlider, {
    label: "newfrom",
    variable_name: "relerp_newfrom",
    values: sliderRange,
});
instance_create_layer(640, 387, layer, ui_UnlerpRelerpSlider, {
    label: "newto",
    variable_name: "relerp_newto",
    values: sliderRange,
});
