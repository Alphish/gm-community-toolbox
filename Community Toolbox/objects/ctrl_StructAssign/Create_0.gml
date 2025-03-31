target = {
    Name: "Lorem",
    Location: "Ipsum",
    Occupation: "Dolor",
};

source1 = {
    Occupation: "PAIN",
    Rank: "D",
    Notes: "Works better alone",
};

source2 = {
    Name: "Lionel",
    Rank: "SSS+",
    Hair: "Brown",
    Eyes: "Amber",
};

assign_sources = function() {
    struct_assign(target, source1, source2);
    with (ui_StructEditor) {
        synchronize();
    }
}
