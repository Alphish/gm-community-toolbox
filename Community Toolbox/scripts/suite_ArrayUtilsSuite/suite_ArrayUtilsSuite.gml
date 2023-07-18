function ArrayUtilsSuite() : VerrificSuiteGroup("Array utilities tests") constructor {
    array_foreach([
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
