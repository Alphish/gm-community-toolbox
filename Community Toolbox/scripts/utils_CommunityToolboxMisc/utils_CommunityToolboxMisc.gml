#region Nullish checks

/// @func is_nullish(value)
/// @desc Checks whether a given value is nullish (undefined or pointer_null) or not.
/// @arg {Any} value        The value to check.
/// @returns {Bool}
function is_nullish(_value) {
    gml_pragma("forceinline");
    return is_undefined(_value ?? undefined);
}

/// @func is_defined(value)
/// @desc Checks whether a given value is not nullish (neither undefined nor pointer_null).
/// @arg {Any} value        The value to check.
/// @returns {Bool}
function is_defined(_value) {
    gml_pragma("forceinline");
    return !is_undefined(_value ?? undefined);
}

#endregion
