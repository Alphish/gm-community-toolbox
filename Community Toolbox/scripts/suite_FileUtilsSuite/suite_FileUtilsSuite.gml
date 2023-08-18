function FileUtilsSuite() : VerrificSuiteGroup("File utilities tests") constructor {
    array_foreach([
        FileReadAllTextTests
    ], function(_test) {
        add_methods_from(_test);
    });
}
