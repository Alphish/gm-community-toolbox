// Inherit the parent event
event_inherited();

on_click = method({ target_room, category }, function() {
    global.last_category_index = category.index;
    room_goto(target_room);
});

image_xscale = 30;
image_yscale = 3;