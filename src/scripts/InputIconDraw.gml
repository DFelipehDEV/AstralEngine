/// InputIconDraw(action, x, y, xScale, yScale, [rot], [color], [alpha])
var _action, _x, _y, _xScale, _yScale, _rot, _color, _alpha;
_action = argument0;
_x = argument1;
_y = argument2;
_xScale = argument3;
_yScale = argument4;
_rot = 0;
_color = c_white;
_alpha = 1;

switch (argument_count) {
    case 8:
        _alpha = argument7;
    case 7:
        _color = argument6;
    case 6:
        _rot = argument5;
        break;
}

var _spr, _frame;
if (!joystick_exists(0)) {
    _spr = sprKeyboardKeys;
    _frame = ds_map_find_value(World.keyInputIcons, _action);
} else {
    _spr = World.buttonSprite;
    _frame = ds_map_find_value(World.buttonInputIcons, _action);
}

if (_spr == 0) exit;

draw_sprite_ext(_spr, _frame, _x, _y, _xScale, _yScale, _rot, _color, _alpha);
