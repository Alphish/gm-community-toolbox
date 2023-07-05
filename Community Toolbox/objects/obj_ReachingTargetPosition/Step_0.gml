// Inherit the parent event
event_inherited();

current_x = clamp(ctrl_ReachingTargets.reach_value(current_x, target_x), 0, sprite_width);
current_y = clamp(ctrl_ReachingTargets.reach_value(current_y, target_y), 0, sprite_height);
