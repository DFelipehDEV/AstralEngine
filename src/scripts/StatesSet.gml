/// StatesSet(state)
var _newState;
_newState = argument0;
if (state != _newState) {
    stateExiting = true;
    script_execute(state);
    stateExiting = false;

    previousState = state;
    state = _newState;
    stateTimer = 0;

    stateEntering = true;
    script_execute(state);
    stateEntering = false;
}
