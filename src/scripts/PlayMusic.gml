/// PlayMusic(music, pitch, loopPart, loopStart, loop)

if (audio_isplaying(argument0)) exit;

var _music, _pitch, _loopPart, _loopStart, _loops;
_music = argument0;
_pitch = argument1;
_loopPart = argument2;
_loopStart = argument3;
_loops = argument4;

audio_music_stop();

if (_loops) {
    audio_set_loop_points(_music, _loopStart, _loopPart);
}

global.currentMusic = _music;
audio_music_play_ext(_music, 0, global.musicVolume, 0, _pitch, _loops);
