function StringUtilsSuite() : VerrificSuiteGroup("String utilities tests") constructor {
    array_foreach([
        StringContainsTests,
        StringToCharArrayTests,
        StringInterpolateTests,
    ], function(_test) {
        add_methods_from(_test);
    });
}
