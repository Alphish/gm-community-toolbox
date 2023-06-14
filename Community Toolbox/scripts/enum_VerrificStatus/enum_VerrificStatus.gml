/// @desc An enum listing the possible test statuses.
enum VerrificStatus {
    /// @desc A status indicating the test has been found, but not scheduled to run.
    Found = 0,
    /// @desc A status indicating the test is planned to run, but hasn't started yet.
    Pending = 1,
    /// @desc A status indicating the test has started, but hasn't finished yet.
    Running = 2,
    /// @desc A status indicating the tast has passed all assertions.
    Passed = 3,
    /// @desc A status indicating the test couldn't be determined to be passed or failing.
    Unsure = 4,
    /// @desc A status indicating the test didn't fail, but had no assertions either.
    Unproven = 5,
    /// @desc A status indicating the test has failed at least one assertion.
    Failed = 6,
    /// @desc A status indicating the test has crashed at some point during processing.
    Crashed = 7,
}
