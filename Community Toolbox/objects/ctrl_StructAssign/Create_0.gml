character = {
    head_type: "HEAD",
    head_color: c_white,
    torso_type: "SHIRT",
    torso_color: c_white,
    legs_type: "TROUSERS",
    legs_color: c_white,
};

color_to_text = function(_color) {
    switch (_color) {
        case c_white:
            return "WHITE";
        case c_red:
            return "RED";
        case c_yellow:
            return "YELLOW";
        case c_lime:
            return "GREEN";
        case c_blue:
            return "BLUE";
    }
}
