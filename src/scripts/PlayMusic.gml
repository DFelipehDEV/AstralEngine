/// PlayMusic(music, [pitch=1], [loopPart=-1], [loopStart=-1], [loops=true])
if (audio_isplaying(argument0)) exit;

var _music, _pitch, _loopPart, _loopStart, _loops;
_music = argument0;
_pitch = 1;
_loopPart = -1;
_loopStart = -1;
_loops = true;
switch (argument_count) {
    case 5:
        _loops = argument4;
    case 4:
        _loopStart = argument3;
    case 3:
        _loopPart = argument2;
    case 2:
        _pitch = argument1;
        break;
}

audio_music_stop();

if (_loops && _loopStart != -1) {
    if (_loopPart != -1) {
        audio_set_loop_points(_music, _loopStart, _loopPart);
    } else {
        audio_set_loop_points(_music, _loopStart);
    }
}

global.currentMusic = _music;
audio_music_play_ext(_music, 0, global.musicVolume, 0, _pitch, _loops);
