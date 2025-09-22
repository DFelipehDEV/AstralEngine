/// PlaySound(sound, [volume=1], [pitch=1], [loop=false], [single=false])
var _sound, _volume, _pitch, _loop, _single;
_sound = argument0;
_volume = 1;
_pitch = 1;
_loop = false;
_single = false;

switch (argument_count) {
    case 5:
        _single = argument4;
    case 4:
        _loop = argument3;
    case 3:
        _pitch = argument2;
    case 2:
        _volume = argument1;
        break;
}

if (_single) {
    return audio_play_single_ext(sound, _volume * global.soundVolume, 0, _pitch, _loop);
}

return audio_play_ext(_sound, _volume * global.soundVolume, 0, _pitch, _loop);
