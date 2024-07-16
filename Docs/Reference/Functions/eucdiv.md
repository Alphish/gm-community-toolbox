[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Math utilities](/Docs/Reference/Groups/MathUtils.md) > [Euclidean division](/Docs/Reference/Groups/MethUtils_Euclidean.md)

# eucdiv

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxMath/utils_CommunityToolboxMath.gml#L24)

Calculates an integer quotient of the Euclidian division (i.e. the division with always non-negative remainder).

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **dividend** | **`Real`** | **Required** | The dividend (i.e. the value to be divided). |
| **divisor** | **`Real`** | **Required** | The divisor (i.e. the value to divide by). |

###### Returns
**`Real`**

### Example

The following code shows using Euclidean division to calculate placement on a 32x32 grid with negative coordinates.

```gml
place_cell_x = eucdiv(mouse_x, 32);
place_cell_y = eucdiv(mouse_y, 32);

place_x = 32 * place_cell_x;
place_y = 32 * place_cell_y;
```

### Update history

- **23.4.0** - Created a function to calculate the quotient of an Euclidean division.
