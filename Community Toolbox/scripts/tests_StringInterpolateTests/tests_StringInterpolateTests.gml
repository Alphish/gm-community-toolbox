function StringInterpolateTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "string_interpolate";
    
    static should_return_empty_string_for_empty_template = function() {
        given_template("");
        given_values({});
        
        when_interpolated();
        then_result_should_be("");
    }
    
    static should_return_same_string_for_no_placeholders = function() {
        given_template("lorem ipsum");
        given_values({});
        
        when_interpolated();
        then_result_should_be("lorem ipsum");
    }
    
    static should_replace_matching_placeholder_with_string = function() {
        given_template("Hello, {greetee}!");
        given_values({ greetee: "world" });
        
        when_interpolated();
        then_result_should_be("Hello, world!");
    }
    
    static should_replace_matching_placeholder_with_nonstring = function() {
        given_template("There are {apples} apples");
        given_values({ apples: 42 });
        
        when_interpolated();
        then_result_should_be("There are 42 apples");
    }
    
    static should_preserve_unmatched_placeholder = function() {
        given_template("Hello, {greetee}!");
        given_values({ apples: 42 });
        
        when_interpolated();
        then_result_should_be("Hello, {greetee}!");
    }
    
    static should_replace_many_placeholders = function() {
        given_template("Weather: {weather}; Temperature: {celsius}C/{fahrenheit}F");
        given_values({ weather: "Cloudy", celsius: 15, fahrenheit: 59 });
        
        when_interpolated();
        then_result_should_be("Weather: Cloudy; Temperature: 15C/59F");
    }
    
    static should_handle_matched_and_unmatched_placeholders = function() {
        given_template("Weather: {weather}; Temperature: {celsius}C/{fahrenheit}F");
        given_values({ celsius: 15, fahrenheit: 59 });
        
        when_interpolated();
        then_result_should_be("Weather: {weather}; Temperature: 15C/59F");
    }
    
    static should_escape_double_opening_braces = function() {
        given_template("Hello, {{greetee}!");
        given_values({ greetee: "world" });
        
        when_interpolated();
        then_result_should_be("Hello, {greetee}!");
    }
    
    static should_escape_double_closing_braces = function() {
        given_template("Hello, {greetee}}!");
        given_values({ greetee: "world" });
        
        when_interpolated();
        then_result_should_be("Hello, {greetee}!");
    }
    
    static should_escape_and_replace_odd_braces = function() {
        given_template("Hello, {{{{{greetee}}}!");
        given_values({ greetee: "world" });
        
        when_interpolated();
        then_result_should_be("Hello, {{world}!");
    }
    
    static should_use_custom_evaluator = function() {
        given_template("Current date: {year:4}-{month:2}-{day:2}");
        given_values({ year: 2021, month: 2, day: 3 });
        given_evaluator(function(_values, _placeholder) {
            var _split = string_split(_placeholder, ":");
            var _key = _split[0];
            var _digits = real(_split[1]);
            return string_replace(string_format(_values[$ _key], _digits, 0), " ", "0");
        });
        
        when_interpolated();
        then_result_should_be("Current date: 2021-02-03");
    }
    
    // -----
    // Setup
    // -----
    
    template = undefined;
    values = undefined;
    evaluator = undefined;
    result = undefined;
    
    static given_template = function(_str) {
        template = _str;
    }
    
    static given_values = function(_values) {
        values = _values;
    }
    
    static given_evaluator = function(_evaluator) {
        evaluator = _evaluator;
    }
    
    static when_interpolated = function() {
        result = is_defined(evaluator)
            ? string_interpolate(template, values, evaluator)
            : string_interpolate(template, values);
    }
    
    static then_result_should_be = function(_str) {
        assert_equal(_str, result);
    }
}
