[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Function utilities](/Docs/Reference/Groups/FunctionUtils.md) > [Constructors](/Docs/Reference/Groups/FunctionUtils_Constructors.md)

# constructor_call

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxFunction/utils_CommunityToolboxFunction.gml#L59)

Creates a new instance of the given constructor.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **constructor** | **`Function`** | **Required** | The constructor to create the instance of. |
| **args** | **`Array`** | Default: `undefined` | Arguments to pass into the constructor (empty by default). |
| **offset** | **`Real`** | Default: `0` | The arguments array index to start taking arguments from (0 by default). |
| **length** | **`Real`** | Default: `undefined` | The number of arguments to take from the array (all by default). |

###### Returns
**`Struct`**

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

- **24.11.0** - Created a function to create a new instance of a constructor with arbitrary arguments.
