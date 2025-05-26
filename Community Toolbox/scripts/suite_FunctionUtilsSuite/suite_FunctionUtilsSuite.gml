function FunctionUtilsSuite() : VerrificSuiteGroup("Function utilities tests") constructor {
    add_methods_from(IsConstructorTests);
    add_methods_from(ConstructorGetParentTests);
    add_methods_from(ConstructorGetChildrenTests);
    add_methods_from(ConstructorCallTests);
    add_methods_from(StaticInitTests);
}
