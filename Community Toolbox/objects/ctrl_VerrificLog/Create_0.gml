// singleton enforcement
if (instance_number(object_index) > 1)
    throw $"There can only be one instance of {object_get_name(object_index)} at a time.";

// general preparations
var _suite = is_callable(suite) ? new suite() : suite;
root = new VerrificSuiteNode(undefined, 0, _suite);
loader = new VerrificTreeLoader(root);
runner = undefined;

lines = [];

// loading in progress styling
pending_background = #0c0c0c;
pending_color = #c0c0c0;
text_font = fnt_VerrificLogLine;
