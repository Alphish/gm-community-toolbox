function CommunityToolboxSuite() : VerrificSuiteGroup("Community toolbox tests") constructor {
    add_suite(new ArrayUtilsSuite());
    add_suite(new FileUtilsSuite());
    add_suite(new MathUtilsSuite());
    add_suite(new MiscUtilsSuite());
}
