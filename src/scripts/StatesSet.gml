/// StatesSet(state, [args...])
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
    switch (argument_count) {
        case 1:  script_execute(state); break;
        case 2:  script_execute(state, argument[1]); break;
        case 3:  script_execute(state, argument[1], argument[2]); break;
        case 4:  script_execute(state, argument[1], argument[2], argument[3]); break;
        case 5:  script_execute(state, argument[1], argument[2], argument[3], argument[4]); break;
        case 6:  script_execute(state, argument[1], argument[2], argument[3], argument[4], argument[5]); break;
        case 7:  script_execute(state, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]); break;
        case 8:  script_execute(state, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]); break;
        case 9:  script_execute(state, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]); break;
        case 10: script_execute(state, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]); break;
        default: script_execute(state, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]); break;
    }
    stateEntering = false;
}
