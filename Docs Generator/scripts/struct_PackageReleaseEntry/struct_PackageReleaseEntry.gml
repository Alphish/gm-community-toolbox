/// @func PackageReleaseEntry(keyname,title,entries)
/// @desc A structure representing a thematic group of updates within a package release.
/// @arg {Struct.ReferenceFunction} function        The function the update applies to.
/// @arg {String} description                       The description of the update.
function PackageReleaseEntry(_function, _description) constructor {
    func = _function;
    description = _description;
}
