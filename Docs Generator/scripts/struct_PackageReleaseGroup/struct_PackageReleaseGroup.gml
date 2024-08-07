/// @func PackageReleaseGroup(keyname,title,entries)
/// @desc A structure representing a thematic group of updates within a package release.
/// @arg {String} keyname                               The identifier of the entity related to the group.
/// @arg {String} title                                 The title of the updates group.
/// @arg {Array<Struct.PackageReleaseEntry>} entries    Update entries within the group.
function PackageReleaseGroup(_keyname, _title, _entries) constructor {
    keyname = _keyname;
    title = _title;
    entries = _entries;
}
