list = ds_list_create_from_array(["List items go", "in these lines", "(each item is one line)"]);
array = ["Those are", "some array", "lines"];

list_text = "";
array_text = "";

convert_list_to_array = function() {
	array = ds_list_to_array(list);
	update_text();
}

convert_array_to_list = function() {
	ds_list_destroy(list);
	list = ds_list_create_from_array(array);
	update_text();
}

add_from_list_to_array = function() {
	ds_list_add_to_array(list, array);
	update_text();
}

add_from_array_to_list = function() {
	ds_list_add_from_array(list, array);
	update_text();
}

add_to_list = function(_text) {
	if (_text == "")
		return;
	
	ds_list_add(list, _text);
	update_text();
}

clear_list = function() {
	ds_list_clear(list);
	update_text();
}

add_to_array = function(_text) {
	if (_text == "")
		return;
	
	array_push(array, _text);
	update_text();
}

clear_array = function() {
	array_resize(array, 0);
	update_text();
}

update_text = function() {
	list_text = string_join_ext("\n", ds_list_to_array(list));
	array_text = string_join_ext("\n", array);
}

update_text();
