var _new_state = state.process();
while (_new_state != state) {
    state = _new_state;
    _new_state = _new_state.init();
}
