/// @function VerrificMessage(text,[status])
/// @desc A struct representing a Verrific test message.
/// @arg {String} text          The content of the message.
/// @arg {Real} status          The Verrific status associated with the message.
function VerrificMessage(_text, _status = undefined) constructor {
    text = _text;
    status = _status;
    is_failure = _status == VerrificStatus.Failed || _status == VerrificStatus.Crashed;
    is_crash = _status == VerrificStatus.Crashed;
}
