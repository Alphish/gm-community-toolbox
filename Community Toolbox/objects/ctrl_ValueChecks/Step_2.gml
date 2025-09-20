value_string = string(value);

check_undefined = is_undefined(value) ? "true" : "false";
check_defined = is_defined(value) ? "true" : "false";
check_nullish = is_nullish(value) ? "true" : "false";
check_string = is_string(value) ? "true" : "false";
check_nonempty_string = is_nonempty_string(value) ? "true" : "false";
check_array = is_array(value) ? "true" : "false";
check_nonempty_array = is_nonempty_array(value) ? "true" : "false";
check_struct = is_struct(value) ? "true" : "false";
check_nonempty_struct = is_nonempty_struct(value) ? "true" : "false";
