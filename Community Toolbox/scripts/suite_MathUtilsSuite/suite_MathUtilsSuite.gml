function MathUtilsSuite() : VerrificSuiteGroup("Math utilities tests") constructor {
    add_methods_from(EuclideanDivisionTests);
    add_methods_from(LerpAngleTests);
    add_methods_from(ApproachTests);
    add_methods_from(ApproachAngleTests);
}
