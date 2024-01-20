/// @func ReferenceRegionStub(keyname,title,summary,sections)
/// @desc A structure representing a script region as described in the reference documentation.
/// @arg {String} keyname                               The name identifying the region within the Community Toolbox project.
/// @arg {String} title                                 The title of the region reference page.
/// @arg {String} summary                               The summary to use in the reference.
/// @arg {Array<Struct.ReferenceSection>} sections      Sections containing additional details.
function ReferenceRegionStub(_keyname, _title, _summary, _sections) : ReferenceItemStub("region", _keyname, _title, _summary, _sections) constructor {
    // no additional data
}
