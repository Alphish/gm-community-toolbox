// make the button move to another room
// if no other action was given
if (is_undefined(on_click)) {
    on_click = method(
        { target_room: target_room },
        function() { room_goto(target_room); }
    );
}

// set the initial state
is_hovered = false;
