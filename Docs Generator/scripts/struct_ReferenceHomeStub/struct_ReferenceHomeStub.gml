/// @func ReferenceHomeStub(title,summary,sections)
/// @desc A structure representing the main page of the reference documentation.
/// @arg {String} title                                 The title of the reference main page.
/// @arg {String} summary                               The summary to use in the reference.
/// @arg {Array<Struct.ReferenceSection>} sections      Sections containing additional details.
function ReferenceHomeStub(_title, _summary, _sections) : ReferenceItemStub("home", "home", _title, _summary, _sections) constructor {
    // no additional data
}
