/// DistanceToView(x, y, [view=0])
var _x, _y_, _view;
_x = argument0;
_y = argument1;
_view = 0;
if (argument_count == 3)
    _view = argument2;

var _vx, _vy, _vw, _vh;
_vx = view_xview[_view];
_vy = view_yview[_view];
_vw = view_wview[_view];
_vh = view_hview[_view];
if (_x >= _vx && _x <= _vx + _vw && _y >= _vy && _y <= _vy + _vh)
    return 0;

var _dx, _dy;
_dx = max(_vx - _x, 0, _x - (_vx + _vw));
_dy = max(_vy - _y, 0, _y - (_vy + _vh));
return point_distance(0, 0, _dx, _dy);
