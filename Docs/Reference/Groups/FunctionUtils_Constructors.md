[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Function utilities](/Docs/Reference/Groups/FunctionUtils.md)

# Constructors

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFunction/utils_CommunityToolboxFunction.gml#L1)

### Defined functions

- [is_constructor](/Docs/Reference/Functions/is_constructor.md)
- [constructor_get_parent](/Docs/Reference/Functions/constructor_get_parent.md)
- [constructor_get_children](/Docs/Reference/Functions/constructor_get_children.md)
- [constructor_call](/Docs/Reference/Functions/constructor_call.md)

### Remarks

The constructor information functions - `is_constructor`, `constructor_get_parent` and `constructor_get_children` - rely on the GameMaker-compiled tags **@@constructor** and **@@parent=&lt;constructor name&gt;**. However, these tags are only added to top-level constructors and not nested constructors, and there are no plans to change it. See this GameMaker report for more details: https://github.com/YoYoGames/GameMaker-Bugs/issues/10317

Thus, if your project uses nested constructors, for them to properly benefit from Community Toolbox constructor information functions you may need to add add relevant tags manually or otherwise work around the issue.
