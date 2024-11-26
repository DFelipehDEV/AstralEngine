///AnimationAdd(name, sprite, start, end, loop, speed, reset, repeat, repeatTimes, linkedAnimation)

var _name, _sprite, _frameStart, _frameEnd, _frameLoop, _frameSpeed, _frameReset, _frameRepeat, _repeatTimes, _linkedAnimation;
_name = argument0;
_sprite = argument1;
_start = argument2;
_end = argument3;
_loop = argument4;
_speed = argument5;
_reset = argument6;
_repeat = argument7;
_repeatTimes = argument8;
_linkedAnimation = argument9;

// Check if the end frame is specified (-1 means use the last frame of the sprite)
if (argument3 == -1) {
    _end = sprite_get_number(argument1) - 1;
}
else {
    _end = argument3;
}

// Check if the looping frame is specified (-1 means no looping)
if (argument4 == -1) {
    _loop = 0;
}
else {
    _loop = argument4;
}

animations[_name] = ds_list_create();

ds_list_add_many(animations[_name], _sprite, _start, _end, _loop, _speed, _reset, _repeat, _repeatTimes, _linkedAnimation);
