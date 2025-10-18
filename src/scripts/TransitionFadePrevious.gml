/// TransitionFadePrevious([color=c_black])
var _color;
_color = c_black;
if (argument_count == 1)
    _color = argument0;

return TransitionFadeRoom(room_previous(room), _color);
