/// @func ReferenceItemStub(type,keyname,title,summary,sections)
/// @desc A base structure for the reference documentation items.
/// @arg {String} type                                  The type of the reference item.
/// @arg {String} keyname                               The name identifying the corresponding project entity.
/// @arg {String} title                                 The title of the reference page.
/// @arg {String} summary                               The summary describing the topic of the reference page.
/// @arg {Array<Struct.ReferenceSection>} sections      Sections containing additional details.
function ReferenceItemStub(_type, _keyname, _title, _summary, _sections) constructor {
    type = _type;
    keyname = _keyname;
    title = _title;
    summary = _summary;
    sections = _sections;
    
    source = undefined;
    
    static get_identification = function() {
        return $"{type} '{keyname}' from {source}";
    }
}
