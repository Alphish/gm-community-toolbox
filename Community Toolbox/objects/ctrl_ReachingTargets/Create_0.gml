title = "";
description = "";
reach_value = undefined;
reach_angle = undefined;

lerp_amount = 0.1;
approach_step = 1;

use_lerp = function() {
    title = "lerp/lerp_angle";
    
    description =
        "Gets closer to the target value by a given fraction amount between the current and the target value.\n" +
        "Amount of 0 matches the current value, amount of 1 matches the target value.\n" +
        "Good for quickly closing the distance between faraway values, but never quite reaches the target.";
    
    reach_value = function(_from, _to) {
        return lerp(_from, _to, lerp_amount);
    }
    
    reach_angle = function(_from, _to) {
        return lerp_angle(_from, _to, lerp_amount);
    }
}

use_approach = function() {
    title = "approach/approach_angle";
    
    description =
        "Gets closer to the target value by a given fixed step.\n" +
        "Will steadily reach the target, but can take a while to cover a larger distance.";
    
    reach_value = function(_from, _to) {
        return approach(_from, _to, approach_step);
    }
    
    reach_angle = function(_from, _to) {
        return approach_angle(_from, _to, approach_step);
    }
}

use_lerp_approach = function() {
    title = "lerp x approach";
    
    description =
        "Gets closer to the target value by a specified fraction of distance, then by a specified fixed step.\n" +
        "'lerp' part will cover the large distances quickly, while 'approach' ensures the target will be reached in reasonable time when close enough.";
    
    reach_value = function(_from, _to) {
        return approach(lerp(_from, _to, lerp_amount), _to, approach_step);
    }
    
    reach_angle = function(_from, _to) {
        return approach_angle(lerp_angle(_from, _to, lerp_amount), _to, approach_step);
    }
}

use_lerp();

// Creating UI controls

instance_create_layer(32, 16, layer, ui_Button, {
    text: "lerp/lerp_angle", on_click: use_lerp, image_xscale: 8
});
instance_create_layer(32, 64, layer, ui_Button, {
    text: "approach/approach_angle", on_click: use_approach, image_xscale: 8
});
instance_create_layer(32, 112, layer, ui_Button, {
    text: "lerp x approach", on_click: use_lerp_approach, image_xscale: 8
});

instance_create_layer(320, 160, layer, ui_ReachingTargetsSlider, {
    label: "Lerp amount",
    variable_name: "lerp_amount",
    values: [-0.1, -0.05, 0, 0.01, 0.02, 0.05, 0.1, 0.15, 0.2, 0.3, 0.5, 1.0, 1.05, 1.1],
});

instance_create_layer(320, 224, layer, ui_ReachingTargetsSlider, {
    label: "Approach step",
    variable_name: "approach_step",
    values: [-3, -2, -1, -0.5, 0, 0.25, 0.5, 0.75, 1, 1.5, 2, 3, 4, 5, 6, 8, 10, 15, 20, 25, 30],
});
