function FileReadAllTextTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "file_read_all_text(...)";
    
    static should_handle_nonexistent_files = function() {
        given_filename("testing/this_file_does_not_exist.txt");
        when_file_text_read();
        then_result().should_be_undefined();
    }
    
    static should_read_blank_text_file = function() {
        given_filename("testing/testblank.txt");
        when_file_text_read();
        then_result().should_be_empty();
    }
    
    static should_read_text_file_with_content = function() {
        given_filename("testing/testtext.txt");
        when_file_text_read();
        then_result().should_be("This is a test text file!");
    }
    
    // -----
    // Setup
    // -----
    
    filename = undefined;
    result = undefined;
    
    static given_filename = function(_value) {
        filename = _value;
    }
    
    static when_file_text_read = function() {
        result = file_read_all_text(filename);
    }
    
    static then_result = function() {
        return new VerrificStringAssertion(test_asserter, result);
    }
}
