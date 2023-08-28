function StringUtilsSuite() : VerrificSuiteGroup("String utilities tests") constructor {
    array_foreach([
        StringToCharArrayTests,
    ], function(_test) {
        add_methods_from(_test);
    });
}
