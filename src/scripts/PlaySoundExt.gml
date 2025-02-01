/// PlaySoundExt(Sound, volume, pitch, loop)

var _sound, _volume, _pitch, _loop;
_sound = argument0;
_volume = argument1;
_pitch = argument2;
_loop = argument3;

switch (_loop) {
    case false:
        // Play a sound
        audio_play_ext(_sound, _volume, 0, _pitch, 0);
        break;

    case true:
        var _soundinstance;
        _soundinstance = audio_loop(_sound);
        audio_set_volume(_soundinstance, _volume);
        audio_set_pitch(_soundinstance, _pitch);
        break;
}
