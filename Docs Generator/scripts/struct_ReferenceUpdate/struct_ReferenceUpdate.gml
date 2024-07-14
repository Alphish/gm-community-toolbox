/// @func ReferenceUpdate(version,description)
/// @desc A structure representing an update to the Community Toolbox function.
/// @arg {String} version           The version the update applies to.
/// @arg {String} description       A description of the function change in the given version.
function ReferenceUpdate(_version, _description) constructor {
    version = _version;
    description = _description;
}
