#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

music = noone;
loopPart = -1;
loopStart = -1;
loopEnd = -1;
loopTotal = -1;

musicVolumeReal = global.musicVolume;
fadeIn = false;
fadeOut = false;
playTempMusic= "";
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade music

// Fade out music
if (fadeIn) {
    if (musicVolumeReal < global.musicVolume) {
        musicVolumeReal += 0.02;
    }
}
else // Fade out music
if (fadeOut) {
    musicVolumeReal = approach(musicVolumeReal, 0, 0.02);
}

if (music != noone) {
    sound_volume(music, musicVolumeReal);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Temp music

if (playTempMusic != "") {
    if (!sound_isplaying(playTempMusic)) {
        PlaySoundExt(playTempMusic, global.musicVolume, 1, false);
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop audio

playTempMusic = "";
fadeOut = false;
fadeIn = false;
// This will only stop common sounds and will not stop the music
sound_kind_stop(0)
