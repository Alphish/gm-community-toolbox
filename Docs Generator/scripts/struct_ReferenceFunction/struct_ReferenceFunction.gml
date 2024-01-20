/// @func ReferenceFunction(tocnode,function,arguments,parent)
/// @desc A structure representing a function in the merged reference documentation.
/// @arg {Struct.ReferenceTocNode} tocnode              The corresponding table of contents node.
/// @arg {Struct.ToolboxFunction} function              The corresponding project function data.
/// @arg {Array<Struct.ReferenceArgument>} arguments    The merged reference arguments data.
/// @arg {Struct.ReferenceItem} parent                  The parent reference item.
function ReferenceFunction(_tocnode, _function, _arguments, _parent) : ReferenceItem(_tocnode, _parent) constructor
{
    project_function = _function;
    project_script = _function.region.script;
    
    summary ??= _function.description;
    
    line = _function.line;
    arguments = _arguments;
    return_type = _function.return_type;
    return_description = _tocnode.stub.return_type;
    
    static get_page_path = function() {
        return "Functions/" + filename;
    }
    
    static get_source_path = function() {
        return $"{parent.get_script_path()}#L{line}";
    }
}
