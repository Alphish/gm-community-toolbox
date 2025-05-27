[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Function utilities](/Docs/Reference/Groups/FunctionUtils.md) > [Constructors](/Docs/Reference/Groups/FunctionUtils_Constructors.md)

# constructor_get_parent

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFunction/utils_CommunityToolboxFunction.gml#L18)

Gets the parent constructor of the given function, or undefined if no such parent was found.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **function** | **`Function`** | **Required** | The function to get the parent constructor of. |

###### Returns
**`Function,Undefined`**

### Remarks

`constructor_get_parent` won't work correctly out of the box for constructors nested inside other functions. See remarks on the [Constructor utilities page](/Docs/Reference/Groups/FunctionUtils_Constructors.md).

### Example

The following code checks if the given constructor is of the correct parent and throws an exception otherwise:

```gml
if (constructor_get_parent(_constructor) != RequiredParentConstructor)
    throw $"{script_get_name(_constructor)} should inherit from RequiredParentConstructor, but doesn't.";

var _instance = new _constructor("lorem", "ipsum");
```

### Update history

- **24.11.0** - Created a function to retrieve the parent of a constructor, if any.
