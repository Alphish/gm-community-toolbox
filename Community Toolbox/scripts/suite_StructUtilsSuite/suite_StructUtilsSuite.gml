function StructUtilsSuite() : VerrificSuiteGroup("Struct utilities tests") constructor {
    array_foreach([
        IsNonemptyStructTests,
        StructAssignTests,
        StructCloneTests,
    ], function(test) {
        add_methods_from(test);
    });
}
