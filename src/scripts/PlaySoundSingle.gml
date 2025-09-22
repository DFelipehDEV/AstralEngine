/// PlaySoundSingle(sound, [volume=1], [pitch=1], [loop=false])
var _sound, _volume, _pitch, _loop;
_sound = argument0;
_volume = 1;
_pitch = 1;
_loop = false;

switch (argument_count) {
    case 4:
        _loop = argument3;
    case 3:
        _pitch = argument2;
    case 2:
        _volume = argument1;
        break;
}

return PlaySound(_sound, _volume, _pitch, _loop, true);
