[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Function utilities](/Docs/Reference/Groups/FunctionUtils.md) > [Constructors](/Docs/Reference/Groups/FunctionUtils_Constructors.md)

# is_constructor

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFunction/utils_CommunityToolboxFunction.gml#L7)

Checks if the given function is marked as a constructor.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **function** | **`Function`** | **Required** | The function to check. |

###### Returns
**`Bool`**

### Remarks

`is_constructor` won't work correctly out of the box for constructors nested inside other functions. See remarks on the [Constructor utilities page](/Docs/Reference/Groups/FunctionUtils_Constructors.md).

### Example

The following code chooses between calling a constructor, a method or a simple function based on its information.

```gml
if (is_constructor(provider))
    result = constructor_call(provider, provider_args);
else if (is_method(provider))
    result = method_call(provider, provider_args);
else
    result = script_execute_ext(provider, provider_args);
```

### Update history

- **24.11.0** - Created a function to check if the given function is a constructor.
