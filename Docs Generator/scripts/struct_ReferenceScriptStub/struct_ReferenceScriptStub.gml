/// @func ReferenceScriptStub(keyname,title,summary,sections)
/// @desc A structure representing a script as described in the reference documentation.
/// @arg {String} keyname                               The name identifying the script within the Community Toolbox project.
/// @arg {String} title                                 The title of the script reference page.
/// @arg {String} summary                               The summary to use in the reference.
/// @arg {Array<Struct.ReferenceSection>} sections      Sections containing additional details.
function ReferenceScriptStub(_keyname, _title, _summary, _sections) : ReferenceItemStub("script", _keyname, _title, _summary, _sections) constructor {
    // no additional data
}
