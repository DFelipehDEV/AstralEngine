/// WorldLogUpdate()
var i;
for (i = ds_list_size(logs) - 1; i >= 0; i -= 1) {
    var _logData, _logAge, _logDur;
    _logData = ds_list_find_value(logs, i);
    _logAge = current_time - ds_map_find_value(_logData, "time");
    _logDur = ds_map_find_value(_logData, "dur");

    if (_logAge > _logDur) {
        dss_destroy(_logData);
        ds_list_delete(logs, i);
    }
}
