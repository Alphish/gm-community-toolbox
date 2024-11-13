function DsListUtilsSuite() : VerrificSuiteGroup("DS List utilities tests") constructor {
    array_foreach([
        DsListCreateFromArrayTests,
        DsListAddFromArrayTests,
        DsListToArrayTests,
        DsListAddToArrayTests
    ], function(_test) {
        add_methods_from(_test);
    });
}
