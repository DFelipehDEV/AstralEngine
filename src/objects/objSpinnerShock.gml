#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
event_inherited();
image_speed = 0.44;
shockSound = PlaySound(sndEnemySpinnerShock, 1, 1, true);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop sound
StopSound(shockSound);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
draw_set_blend_mode(bm_add)
draw_self();
draw_set_blend_mode(bm_normal)
