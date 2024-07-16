[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md)

# Array utilities

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml)

### Defined functions

- [Maths on number arrays](/Docs/Reference/Groups/ArrayUtils_Maths.md)
    - [array_max](/Docs/Reference/Functions/array_max.md)
    - [array_min](/Docs/Reference/Functions/array_min.md)
    - [array_median](/Docs/Reference/Functions/array_median.md)
    - [array_mean](/Docs/Reference/Functions/array_mean.md)
    - [array_sum](/Docs/Reference/Functions/array_sum.md)
- [Retrieving random items](/Docs/Reference/Groups/ArrayUtils_Random.md)
    - [array_get_random](/Docs/Reference/Functions/array_get_random.md)
    - [array_pop_random](/Docs/Reference/Functions/array_pop_random.md)

### Using offset and length arguments

Functions that operate on a range of array items usually have `offset` and `length` arguments. The former determines the starting index, the latter the length of the items range.

Some things to note:
- `offset` is usually 0 by default (i.e. corresponds to the first item)
- negative offset counts the index from the end of the array (so e.g. offset of -1 points to the very last item, and offset of -3 points to the third last item)
- `length` usually matches the entire array length by default
- negative length implies traversing the array backwards (e.g. if the index given by the offset is 7 and the length is -4, the processed indices are: 7, 6, 5, 4)
- if some processed indices are out of the array's range, they are ignored; e.g. if the indices to process are 5, 6, 7, 8, 9 but the array only has indices from 0 to 6, then only indices 5 and 6 are processed
- if all of processed indices are out of the array's range, the result is the same as for an empty array

**Note:** This behaviour is intended to match that of GameMaker's built-in functions, but there might be slight differences.
