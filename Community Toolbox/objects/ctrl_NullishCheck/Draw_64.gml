draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_DemoInfo);

draw_text(
    24, 24,
    $"Nullish checks demo\n" +
    $"===================\n" +
    $"\n" +
    $"is_undefined(undefined) = { is_undefined(undefined) ? "true" : "false" }\n" + 
    $"is_undefined(pointer_null) = { is_undefined(pointer_null) ? "true" : "false" }\n" + 
    $"\n" +
    $"is_nullish(undefined) = { is_nullish(undefined) ? "true" : "false" }\n" + 
    $"is_nullish(pointer_null) = { is_nullish(pointer_null) ? "true" : "false" }\n" + 
    $"is_nullish(0) = { is_nullish(0) ? "true" : "false" }\n" + 
    $"is_nullish(-1) = { is_nullish(-1) ? "true" : "false" }\n" + 
    $"is_nullish(\"\") = { is_nullish("") ? "true" : "false" }\n" + 
    $"is_nullish(\"hello\") = { is_nullish("hello") ? "true" : "false" }\n" + 
    $"\n" +
    $"is_defined(undefined) = { is_defined(undefined) ? "true" : "false" }\n" + 
    $"is_defined(pointer_null) = { is_defined(pointer_null) ? "true" : "false" }\n" + 
    $"is_defined(0) = { is_defined(0) ? "true" : "false" }\n" + 
    $"is_defined(-1) = { is_defined(-1) ? "true" : "false" }\n" + 
    $"is_defined(\"\") = { is_defined("") ? "true" : "false" }\n" + 
    $"is_defined(\"hello\") = { is_defined("hello") ? "true" : "false" }\n" + 
    ""
    );