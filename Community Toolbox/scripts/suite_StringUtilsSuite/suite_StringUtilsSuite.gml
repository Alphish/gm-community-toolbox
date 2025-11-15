function StringUtilsSuite() : VerrificSuiteGroup("String utilities tests") constructor {
    array_foreach([
        IsNonemptyStringTests,
        StringContainsTests,
        StringToCharArrayTests,
        StringInterpolateTests,
    ], function(_test) {
        add_methods_from(_test);
    });
}
