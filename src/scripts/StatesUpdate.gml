/// StatesUpdate([timeScale])
var _timeScale;
_timeScale = 1;
if (argument_count == 1) {
    _timeScale = argument0;
}
if (!stateEntering && !stateExiting) {
    script_execute(state);
    stateTimer += 1 * _timeScale;
}
