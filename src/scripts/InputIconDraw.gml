/// InputIconDraw(action, x, y, xScale, yScale)
var _action, _x, _y, _xScale, _yScale, _rot, _color, _alpha;
_action = argument0;
_x = argument1;
_y = argument2;
_xScale = argument3;
_yScale = argument4;

var _spr;
if (!joystick_exists(0)) {
    _spr = ds_map_find_value(global.keyInputIcons, _action);
} else {
    _spr = ds_map_find_value(global.buttonInputIcons, _action);
}

if (_spr == 0) exit;

draw_sprite_ext(ds_list_find_value(_spr, 0), ds_list_find_value(_spr, 1), _x, _y, _xScale, _yScale, 0, c_white, 1);
