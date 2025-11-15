// dummy functions to test the constructors functionality

function ConstructorTests_SimpleFunction() {
}

function ConstructorTests_SimpleConstructor() constructor {
}

function ConstructorTests_Parent() constructor {
    parent_value = 123;
}

function ConstructorTests_ChildA() : ConstructorTests_Parent() constructor {
    child_value = 123;
}

function ConstructorTests_ChildB() : ConstructorTests_Parent()  constructor {
    child_value = 456;
}

function ConstructorTests_ChildC() : ConstructorTests_Parent()  constructor {
    child_value = 789;
}

function ConstructorTests_GrandchildC() : ConstructorTests_ChildC() constructor {
    grandchild_value = 999;
}

function ConstructorTests_OuterConstructor() constructor {
    static ConstructorTests_InnerConstructor = function() constructor {
    }
}

function ConstructorTests_ConstructorWithArgs(_first, _second, _third) {
    first = _first;
    second = _second;
    third = _third;
}

function ConstructorTests_OtherConstructor(_own) constructor {
    own_value = _own;
    other_value = other.value;
}
