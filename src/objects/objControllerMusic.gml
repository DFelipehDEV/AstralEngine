#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

loopPart = -1;
loopStart= -1;
loopEnd= -1;
loopTotal= -1;

musicVolumeReal = global.volumeMusic;
fadeIn = false;
fadeOut = false;
soundIndex = -1;
playTempMusic= "null";
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade music

// Fade out music
if (fadeIn) {
    if (musicVolumeReal < global.volumeMusic) {
        musicVolumeReal += 0.02;
    }
}
else // Fade out music
if (fadeOut) {
    musicVolumeReal = approach(musicVolumeReal, 0, 0.02);
}

if (global.bgmSound != -1) {
    sound_volume(global.bgmSound, musicVolumeReal);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Temp music

if (playTempMusic != "null") {
    if (!sound_isplaying(playTempMusic)) {
        PlaySoundExt(playTempMusic, global.volumeMusic, 1, false);
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop audio

playTempMusic = "null";
fadeOut = false;
fadeIn = false;
// This will only stop common sounds and will not stop the music
sound_kind_stop(0)
