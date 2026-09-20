#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
image_speed = 0.3;
strength = 13;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//override grid 32,32,0,0
//field strength: value
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// On Interaction
CreateDummy(x, y, sprDashDust, 0.25, 0, depth - 1, bm_normal, image_alpha, image_xscale, image_yscale, image_angle);
PlaySound(sndDashPad);
