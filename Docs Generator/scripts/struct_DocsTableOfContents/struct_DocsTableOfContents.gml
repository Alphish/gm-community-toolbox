/// @func DocsTableOfContents(tochome,releases)
/// @desc A structure representing documentation table of contents.
/// @arg {Struct.ReferenceHome} tochome     The reference home node.
/// @arg {Array<String>} releases           The list of releases versions included.
function DocsTableOfContents(_tochome, _releases) constructor {
    toc_home = _tochome;
    releases = _releases;
}
