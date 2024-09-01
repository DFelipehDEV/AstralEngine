/// PlayMusic(Music, Pitch, Loop part, Loop start, ShouldLoop)

if (sound_isplaying(argument0)) exit;

var _music, _pitch, _loopPart, _loopStart, _loops;
_music = argument0;
_pitch = argument1;
_loopPart = argument2;
_loopStart = argument3;
_loops = argument4;

sound_stop_all();

musicVolumeReal = global.musicVolume;

// Check if the loop argument is true
if (_loops) {
    var _length;
    _length = sound_get_length(_music);
    // Stay this info on memory
    loopStart = _loopStart/_length;
    loopEnd = _loopPart/_length;

    sound_set_loop(_music, loopStart, loopEnd, false);
    // Loop music
    objMusicManager.music = sound_loop(_music);
    sound_volume(objMusicManager.music, musicVolumeReal);

}
else {
    // Play the music
    objMusicManager.music = sound_play_ex(_music, musicVolumeReal, _pitch, 0);
}
