/// @func InitState()
/// @desc The initial state of the application.
function InitState() : AppState() constructor{
    static process = function() {
        return new ProjectLoadingState();
    }
}
