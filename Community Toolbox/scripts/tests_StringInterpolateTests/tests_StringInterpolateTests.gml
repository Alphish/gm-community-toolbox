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
    
    static should_replace_inner_placeholder_only = function() {
        given_template("{outer{inner}outer}");
        given_values({});
        
        // using an evaluator that replaces any valid placeholder with its uppercase content
        // so that results aren't spoiled by e.g. "{outer{inner}" key not existing and trying to find the next best thing
        given_evaluator(function(_values, _placeholder) { return string_upper(_placeholder); });
        
        when_interpolated();
        then_result_should_be("{outerINNERouter}");
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
            return string_replace_all(string_format(_values[$ _key], _digits, 0), " ", "0");
        });
        
        when_interpolated();
        then_result_should_be("Current date: 2021-02-03");
    }
    
    static should_allow_recursive_interpolation = function() {
        given_template("Money: {money} | Score: {score} | Energy: {energy}");
        given_values({
            money: 6245.3, money_format: "${2.2}",
            score: 15648, score_format: "{8.0}pts",
            energy: 37.13, energy_format: "{0.0}/100"
            });
        given_evaluator(function(_values, _placeholder) {
            if (!struct_exists(_values, _placeholder))
                return undefined;
            
            var _amount = _values[$ _placeholder];
            var _format = _values[$ _placeholder + "_format"];
            return string_interpolate(_format, _amount, function(_value, _prec) {
                var _split = string_split(_prec, ".");
                var _total = real(_split[0]);
                var _decimals = real(_split[1]);
                return string_replace_all(string_format(_value, _total, _decimals), " ", "0");
            });
        });
        
        when_interpolated();
        then_result_should_be("Money: $6245.30 | Score: 00015648pts | Energy: 37/100");
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
