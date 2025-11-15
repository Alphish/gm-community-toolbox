@region <Function:Constructors> Constructors

@section Remarks

The constructor information functions - `is_constructor`, `constructor_get_parent` and `constructor_get_children` - rely on the GameMaker-compiled tags **@@constructor** and **@@parent=&lt;constructor name&gt;**. However, these tags are only added to top-level constructors and not nested constructors, and there are no plans to change it. See this GameMaker report for more details: https://github.com/YoYoGames/GameMaker-Bugs/issues/10317

Thus, if your project uses nested constructors, for them to properly benefit from Community Toolbox constructor information functions you may need to add add relevant tags manually or otherwise work around the issue.

@func <is_constructor>

@section Remarks

`is_constructor` won't work correctly out of the box for constructors nested inside other functions. See remarks on the [Constructor utilities page](/Docs/Reference/Groups/FunctionUtils_Constructors.md).

@section Example

The following code chooses between calling a constructor, a method or a simple function based on its information.

```gml
if (is_constructor(provider))
    result = constructor_call(provider, provider_args);
else if (is_method(provider))
    result = method_call(provider, provider_args);
else
    result = script_execute_ext(provider, provider_args);
```

@update 24.11.0
Created a function to check if the given function is a constructor.

@func <constructor_get_parent>

@section Remarks

`constructor_get_parent` won't work correctly out of the box for constructors nested inside other functions. See remarks on the [Constructor utilities page](/Docs/Reference/Groups/FunctionUtils_Constructors.md).

@section Example

The following code checks if the given constructor is of the correct parent and throws an exception otherwise:

```gml
if (constructor_get_parent(_constructor) != RequiredParentConstructor)
    throw $"{script_get_name(_constructor)} should inherit from RequiredParentConstructor, but doesn't.";

var _instance = new _constructor("lorem", "ipsum");
```

@update 24.11.0
Created a function to retrieve the parent of a constructor, if any.

@func <constructor_get_children>

@section Remarks

`constructor_get_children` won't work correctly out of the box for constructors nested inside other functions. See remarks on the [Constructor utilities page](/Docs/Reference/Groups/FunctionUtils_Constructors.md).

@section Example

The following code searches for children of a generic command constructor and makes an array of commands instances:

```gml
var _command_constructors = constructor_get_children(BaseCommand);
commands = array_map(_command_constructors, function(_constructor) { return new _constructor(); });
```

@update 24.11.0
Created a function to retrieve the children of a constructor, if any.

@func <constructor_call>

@section Example

The following code chooses between calling a constructor, a method or a simple function based on its information.

```gml
if (is_constructor(provider))
    result = constructor_call(provider, provider_args);
else if (is_method(provider))
    result = method_call(provider, provider_args);
else
    result = script_execute_ext(provider, provider_args);
```

@update 24.11.0
Created a function to create a new instance of a constructor with arbitrary arguments.
