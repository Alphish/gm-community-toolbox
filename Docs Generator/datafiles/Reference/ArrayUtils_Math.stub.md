@region <Array:Array-wide maths> Maths on number arrays

@func <array_max>

@section Example

The following code finds the highest level in the party:

```gml
var _heroes = [
    { name: "Alice", level: 14, gold: 165 },
    { name: "Bob", level: 16, gold: 546 },
    { name: "Charlie", level: 9, gold: 1753 },
    ];
var _levels = array_map(_heroes, function(_hero) { return _hero.level; });
var _max_level = array_max(_levels);
show_debug_message(_max_level);
```

@update 23.4.0
Created a function to find the lowest value in a numbers array.

@func <array_min>

@section Example

The following code finds the lowest level in the party:

```gml
var _heroes = [
    { name: "Alice", level: 14, gold: 165 },
    { name: "Bob", level: 16, gold: 546 },
    { name: "Charlie", level: 9, gold: 1753 },
    ];
var _levels = array_map(_heroes, function(_hero) { return _hero.level; });
var _min_level = array_min(_levels);
show_debug_message(_min_level);
```

@update 23.4.0
Created a function to find the greatest value in a numbers array.

@func <array_median>

@section Example

The following code finds the median level in the party:

```gml
var _heroes = [
    { name: "Alice", level: 14, gold: 165 },
    { name: "Bob", level: 16, gold: 546 },
    { name: "Charlie", level: 9, gold: 1753 },
    ];
var _levels = array_map(_heroes, function(_hero) { return _hero.level; });
var _median_level = array_median(_levels);
show_debug_message(_median_level);
```

@update 23.4.0
Created a function to find the median value in a numbers array.

@func <array_mean>

@section Example

The following code finds the mean level in the party:

```gml
var _heroes = [
    { name: "Alice", level: 14, gold: 165 },
    { name: "Bob", level: 16, gold: 546 },
    { name: "Charlie", level: 9, gold: 1753 },
    ];
var _levels = array_map(_heroes, function(_hero) { return _hero.level; });
var _mean_level = array_mean(_levels);
show_debug_message(_mean_level);
```

@update 23.4.0
Created a function to calculate the average value of the numbers array values.

@func <array_sum>

@section Example

The following code finds the total gold shared between heroes in the party:

```gml
var _heroes = [
    { name: "Alice", level: 14, gold: 165 },
    { name: "Bob", level: 16, gold: 546 },
    { name: "Charlie", level: 9, gold: 1753 },
    ];
var _heroes_gold = array_map(_heroes, function(_hero) { return _hero.gold; });
var _total_gold = array_sum(_heroes_gold);
show_debug_message(_total_gold);
```

@update 23.4.0
Created a function to calculate the sum of the numbers array values.
