/// PlayVoice(sound)
if (argument0 == -1) exit;
return audio_play_ext(argument0, global.voiceVolume, 0, 1, 0);
