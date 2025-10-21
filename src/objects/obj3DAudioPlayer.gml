#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
snd = -1;
audio = -1;
volume = 1;
soundPan = 0;
maxDistance = 650;
panDistance = 200;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle audio pan
var _cam;
_cam = instance_nearest(x, y, objCamera);
if (_cam == noone || snd == -1) exit;

var _distance, _normalizedDistance;
_distance = distance_to_object(_cam);
_normalizedDistance = _distance / maxDistance;

if (audio == -1) {
    audio = PlaySound(snd, volume - _normalizedDistance, pitch, loop);
}

if (_distance < maxDistance) {
    soundPan = clamp(-(_cam.x - x) / panDistance, -1, 1);

    audio_set_pan(audio, soundPan)
    audio_set_volume(audio, (power(1 - _normalizedDistance, 2)) * (global.soundVolume * volume));
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field snd : sound
//field volume : number
//field pitch : number
//field loop : bool
//field maxDistance: number
//field panDistance: number
