#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
image_speed = 0.25;
roomTarget = room;

transitioning = false;
transitionColor = c_black;
transitionSpeed = 0.02;
transitionTimer = 0;
transition = noone;

interactSound = sndRingSpecial;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Teleport
if (!transitioning) {
    var _player;
    _player = instance_place(x, y, objPlayer);

    if (_player != noone) {
        transitioning = true;
        instance_destroy_id(_player);
        PlaySound(interactSound);
    }
} else {
    transitionTimer += global.timeScale;
    if (transitionTimer > 60 && !instance_exists(transition)) {
        transition = TransitionFadeRoom(roomTarget, transitionColor, transitionSpeed);
        PlayerResetGlobalVariables();
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field roomTarget : room
//field transitionColor : color
//field transitionSpeed : number
//field interactSound : sound
//field sprite_index : sprite
//field image_speed : number
