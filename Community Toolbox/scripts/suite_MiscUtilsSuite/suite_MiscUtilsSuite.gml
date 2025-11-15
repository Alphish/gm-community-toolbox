function MiscUtilsSuite() : VerrificSuiteGroup("Miscellaneous utilities tests") constructor {
    add_methods_from(IsNullishTests);
    add_methods_from(IsDefinedTests);
}
