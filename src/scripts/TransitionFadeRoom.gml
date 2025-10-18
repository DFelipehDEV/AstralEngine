/// TransitionFadeRoom([room=-1], [color=c_black], [speed=0.03], [delay=0.5])
var _room, _color, _speed, _delay;
_room = -1;
_color = c_black;
_speed = 0.03;
_delay = 0.5;

switch (argument_count) {
    case 4:
        _delay = argument3;
    case 3:
        _speed = argument2;
    case 2:
        _color = argument1;
    case 1:
        _room = argument0;
        break;
}

var _fade;
_fade = instance_create(0, 0, objFadeRoom);
with (_fade) {
    roomTarget = _room;
    alphaSpeed = _speed;
    delay = _delay;
    image_blend = _color;
}

return _fade;
