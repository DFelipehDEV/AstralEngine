/// PlayMusic(music, [pitch=1], [loopPart=-1], [loopStart=-1], [loops=true])
if (sound_isplaying(argument0)) exit;

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

//sound_backgroun;

global.currentMusic = sound_loop_ext(_music, global.musicVolume, 0, _pitch, false, true);
if (_loops && _loopStart != -1) {
    if (_loopPart != -1) {
        sound_set_loop(global.currentMusic, _loopStart, _loopPart);
    } else {
        sound_set_loop(global.currentMusic, _loopStart);
    }
}

//audio_music_play_ext(_music, 0, global.musicVolume, 0, _pitch, _loops);
