/// PlayVoice(sound)
if (argument0 == -1) exit;
return sound_play_ext(argument0, global.voiceVolume, 0, 1, false, false);
