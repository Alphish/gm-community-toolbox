/// @func VerrificStatusCounter()
/// @desc A struct keeping track of the test statuses within a given test suite.
/// @arg {Struct.VerrificStatusCounter,Undefined} parent        The greater scope parent status counter.
function VerrificStatusCounter(_parent) constructor {
    parent_counter = _parent;
    
    total = 0;
    found = 0;
    pending = 0;
    running = 0;
    passed = 0;
    unsure = 0;
    unproven = 0;
    failed = 0;
    crashed = 0;
    
    /// @ignore
    static status_properties = [
        "found", "pending", "running", "passed", "unsure", "unproven", "failed", "crashed"
    ];
    
    /// @func get_property_for(status)
    /// @desc Gets the name of status counter property corresponding to the given status.
    /// @arg {Real} status          The Verrific test status to get the property of.
    static get_property_for = function(_status) {
        return status_properties[_status];
    }
    
    /// @func count_status(status,amount)
    /// @desc Changes a status count by the given amount. The change propagates to parent status counters as well.
    /// @arg {String} status        The status property to change the count of.
    /// @arg {Real} amount          The amount by which the given status should be changed.
    static count_status = function(_status, _amount) {
        self[$ _status] += _amount;
        if (!is_undefined(parent_counter))
            parent_counter.count_status(_status, _amount);
    }

    /// @func add_test_status(status)
    /// @desc Counts up a newly found status of a Verrific test.
    /// @arg {Real} status          The status to add.
    static add_test_status = function(_status) {
        var _status_property = status_properties[_status];
        count_status("total", 1);
        count_status(_status_property, 1);
    }
    
    /// @func change_test_status(status)
    /// @desc Counts a change from one status to another.
    /// @arg {Real} old             The status to count down.
    /// @arg {Real} new             The status to count up.
    static change_test_status = function(_old, _new) {
        var _old_status = status_properties[_old];
        var _new_status = status_properties[_new];
        count_status(_old_status, -1);
        count_status(_new_status, 1);
    }
    
    /// @func get_summary()
    /// @desc Gets a string summarizing the statuses counts.
    /// @returns {String}
    static get_summary = function() {
        var _result = "";
        for (var i = 1; i < array_length(status_properties); i++) {
            var _property = status_properties[i];
            if (self[$ _property] == 0)
                continue;
            
            _result += $", {self[$ _property]} {_property}";
        }
        return string_delete(_result, 1, 2);
    }
    
    /// @func get_aggregate_status()
    /// @desc Calculates the suite-wide status based on the individual statuses counts.
    /// @returns {Real}
    static get_aggregate_status = function() {
        if (crashed > 0)
            return VerrificStatus.Crashed;
        else if (failed > 0)
            return VerrificStatus.Failed;
        else if (unproven > 0)
            return VerrificStatus.Unproven;
        else if (unsure > 0)
            return VerrificStatus.Unsure;
        else if (running > 0)
            return VerrificStatus.Running;
        else if (pending > 0)
            return VerrificStatus.Pending;
        else if (passed > 0)
            return VerrificStatus.Passed;
        else
            return VerrificStatus.Found;
    }
}
