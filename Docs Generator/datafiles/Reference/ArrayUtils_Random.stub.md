@region <Array:Random elements> Retrieving random items

@func <array_get_random>

@section Example

The following code picks a random word from the nouns dictionary:

```gml
randomize();
var _known_nouns = ["Apple", "Banana", "Cherry", "Date", "Elderberry"];
var _random_noun = array_get_random(_known_nouns);
show_debug_message(_random_noun);
```

@func <array_pop_random>

@section Example

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
