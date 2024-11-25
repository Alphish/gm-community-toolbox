function StructUtilsSuite() : VerrificSuiteGroup("Struct utilities tests") constructor {
    array_foreach([
        StructAssignTests
    ], function(test) {
        add_methods_from(test);
    });
}
