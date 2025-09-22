/// StatesSet(state, [args...])
var _newState;
_newState = argument0;
if (state != _newState) {
    stateExiting = true;
    script_execute(state, argument1, argument2, argument3, argument4, argument5,
                        argument6, argument7, argument8, argument9, argument10);
    stateExiting = false;

    previousState = state;
    state = _newState;
    stateTimer = 0;

    stateEntering = true;
    script_execute(state, argument1, argument2, argument3, argument4, argument5,
                        argument6, argument7, argument8, argument9, argument10);
    stateEntering = false;
}
