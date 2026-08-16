/// WorldLogDraw()
var _logCount;
_logCount = ds_list_size(logs);

var i;
for (i = 0; i < _logCount; i += 1) {
    var _logData, _content, _time, _logAge, _maxAge;
    _logData = ds_list_find_value(logs, i);
    _content = ds_map_find_value(_logData, "message");
    _time = ds_map_find_value(_logData, "time");
    _logAge = current_time - _time;
    _maxAge = ds_map_find_value(_logData, "dur");

    var _t, _alpha;
    _t = _logAge / _maxAge;
    _alpha = 1 - (_t * _t * _t);

    BeginUI();
    draw_set_font(fontConsolas10);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_set_alpha(_alpha);
    draw_text(0, (i * 14), _content);
    draw_set_alpha(1);
    EndUI();
}
