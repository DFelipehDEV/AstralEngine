/// PlaySoundExt(Sound, volume, pitch, loop)

var _sound, _volume, _pitch, _loop;
_sound = argument0;
_volume = argument1;
_pitch = argument2;
_loop = argument3;

audio_play_ext(_sound, _volume, 0, _pitch, _loop);
