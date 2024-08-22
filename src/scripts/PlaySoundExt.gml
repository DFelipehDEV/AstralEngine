/// PlaySoundExt(Sound, volume, pitch, loop)

var _sound, _volume, _pitch, _loop;
_sound = argument0;
_volume = argument1;
_pitch = argument2;
_loop = argument3;

switch (_loop) {
    case false:
        // Play a sound
        sound_play_ex(_sound, _volume, _pitch, 0);
        break;

    case true:
        var _soundinstance;
        _soundinstance = sound_loop(_sound);
        sound_volume(_soundinstance, _volume);
        sound_pitch(_soundinstance, _pitch);
        break;
}
