[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Basic operations](/Docs/Reference/Groups/ArrayUtils_Basics.md)

# is_nonempty_array

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L7)

Checks if a given value is an array that's not empty.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **value** | **`Any`** | **Required** | The value to check. |

###### Returns
**`Bool`**

### Example

The following code applies a tags filter from a query struct if a non-empty array of tags is present.

```gml
if (is_nonempty_array(_query.tags)) {
    filter_assets_by_tags(_assets, _query.tags);
}
```

### Update history

- **24.11.0** - Created a function to check if a value is an array that's not empty.
