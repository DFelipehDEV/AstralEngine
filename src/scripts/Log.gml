/// Log(message, [duration=160])
if (!debug_mode) return -1;
var _message, _dur;
_message = argument0;
_dur = 160;
if (argument_count == 2) _dur = argument1;

var _log;
_log = ds_map_create();
ds_map_add(_log, "message", _message);
ds_map_add(_log, "dur", _dur * (1000/60));
ds_map_add(_log, "time", current_time);
ds_list_add(global.logs, _log);
show_debug_message(_message);
return _log;
