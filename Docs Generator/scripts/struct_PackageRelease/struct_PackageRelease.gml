/// @func PackageRelease(version,groups)
/// @desc A structure representing a GameMaker Community Toolbox package release.
/// @arg {String} version                               The release version.
/// @arg {Array<Struct> downloads                       The release download data.
/// @arg {Array<Struct.PackageReleaseGroup>} groups     The groups of updates included in the release.
function PackageRelease(_version, _downloads, _groups) constructor {
    version = _version;
    downloads = _downloads;
    groups = _groups;
}
