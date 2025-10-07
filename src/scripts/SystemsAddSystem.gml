/// SystemsAddSystem(systemScript)
var _sys;
_sys = argument0;
if (script_exists(_sys)) {
    ds_list_add(global.systems.systems, _sys);
    script_execute(_sys, ev_create);
}
