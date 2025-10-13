/// TransitionFadeRoom(room, [color])
var _room, _color;
_room = argument0;
_color = c_black;
if (argument_count == 2)
    _color = argument1;

var _fade;
_fade = instance_create(0, 0, objFadeRoom);
with (_fade) {
    roomTarget = _room;
    image_blend = _color;
}

return _fade;
