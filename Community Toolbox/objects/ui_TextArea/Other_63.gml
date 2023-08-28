///@desc Accept text input

if (async_load[? "id"] == text_popup_id) {
    if (async_load[? "status"]) {
        text = async_load[? "result"];
    }
    text_popup_id = -1;
}
