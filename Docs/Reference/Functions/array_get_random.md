[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Retrieving random items](/Docs/Reference/Groups/ArrayUtils_Random.md)

# array_get_random

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L209)

Returns a random element from the array or its subsection. If the array/subsection is empty, undefined is returned.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to get the random element from. |
| **offset** | **`Real`** | Default: `0` | The starting index of the subsection (for a negative offset, it will count from array end). |
| **length** | **`Real`** | Default: `undefined` | The length of the subsection (for a negative length, it will count backwards from the offset position). |

###### Returns
**`Any`**

### Example

The following code picks a random word from the nouns dictionary:

```gml
randomize();
var _known_nouns = ["Apple", "Banana", "Cherry", "Date", "Elderberry"];
var _random_noun = array_get_random(_known_nouns);
show_debug_message(_random_noun);
```

### Update history

- **23.4.0** - Created a function to get a random value from an array.
