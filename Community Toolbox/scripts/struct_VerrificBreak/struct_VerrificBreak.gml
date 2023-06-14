/// @func VerrificBreak(text,[status])
/// @desc A Verrific message for interrupting the test. Should be thrown as exception.
/// @arg {String} text          The text describing the reason for break.
/// @arg {Real} status          The Verrific status associated with the break.
function VerrificBreak(_text, _status = undefined) : VerrificMessage(_text, _status) constructor { }
