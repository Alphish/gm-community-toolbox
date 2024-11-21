function ArrayUtilsSuite() : VerrificSuiteGroup("Array utilities tests") constructor {
    array_foreach([
        ArrayEmptyTests,
        ArrayClearTests,
        ArrayMaxTests,
        ArrayMinTests,
        ArrayMeanTests,
        ArrayMedianTests,
        ArraySumTests,
        ArrayGetRandomTests,
        ArrayPopRandomTests,
    ], function(test) {
        add_methods_from(test);
    });
}
