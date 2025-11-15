[Home](/README.md) > [Community Toolbox Reference](/Docs/Reference/Reference.md) > [Array utilities](/Docs/Reference/Groups/ArrayUtils.md) > [Retrieving random items](/Docs/Reference/Groups/ArrayUtils_Random.md)

# array_pop_random

[Go to source](/Community%20Toolbox/scripts/utils_CommunityToolboxArray/utils_CommunityToolboxArray.gml#L373)

Pops a random element from the array or its subsection. If the array/subsection is empty, undefined is returned.

###### Arguments

| Argument | Type | Usage | Description |
|:---:|:---:|:---:|:---|
| **array** | **`Array`** | **Required** | The array to pop the random element from. |
| **offset** | **`Real`** | Default: `0` | The starting index of the subsection (for a negative offset, it will count from array end). |
| **length** | **`Real`** | Default: `undefined` | The length of the subsection (for a negative length, it will count backwards from the offset position). |

###### Returns
**`Any`**

### Example

The following code picks a hand of 5 cards from 24 cards available:

```gml
randomize();

var _available_cards = [
    "9 of Clubs", "9 of Diamonds", "9 of Hearts", "9 of Spades",
    "10 of Clubs", "10 of Diamonds", "10 of Hearts", "10 of Spades",
    "Jack of Clubs", "Jack of Diamonds", "Jack of Hearts", "Jack of Spades",
    "Queen of Clubs", "Queen of Diamonds", "Queen of Hearts", "Queen of Spades",
    "King of Clubs", "King of Diamonds", "King of Hearts", "King of Spades",
    "Ace of Clubs", "Ace of Diamonds", "Ace of Hearts", "Ace of Spades",
    ];

var _hand = [];
repeat (5) {
    array_push(_hand, array_pop_random(_available_cards));
}

// the hand should now have 5 random cards
show_debug_message(_hand);

// the cards in hand are not in available cards anymore
show_debug_message(_available_cards);
```

### Update history

- **23.4.0** - Created a function to get and remove a random value from an array.
