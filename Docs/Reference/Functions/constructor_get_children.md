[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Function utilities](/Docs/Reference/Groups/FunctionUtils.md) > [Constructors](/Docs/Reference/Groups/FunctionUtils_Constructors.md)

# constructor_get_children

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFunction/utils_CommunityToolboxFunction.gml#L38)

Gets the children constructors of the given constructor, or an empty array

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **function** | **`Function`** | **Required** | The function to get the children constructors of. |

###### Returns
**`Array<Function>`**

### Remarks

`constructor_get_children` won't work correctly out of the box for constructors nested inside other functions. See remarks on the [Constructor utilities page](/Docs/Reference/Groups/FunctionUtils_Constructors.md).

### Example

The following code searches for children of a generic command constructor and makes an array of commands instances:

```gml
var _command_constructors = constructor_get_children(BaseCommand);
commands = array_map(_command_constructors, function(_constructor) { return new _constructor(); });
```

### Update history

- **24.11.0** - Created a function to retrieve the children of a constructor, if any.
