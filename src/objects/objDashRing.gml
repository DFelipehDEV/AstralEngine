#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

strength = 8;
playerAction = PlayerStateSpring; //Player state when he meets the dash ring
interactSound = sndDashRing;

image_speed = 0.3;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Deshrink animation
if (image_xscale < 1 && image_yscale < 1) {
    image_xscale = min(image_xscale + 0.04, 1);
    image_yscale = image_xscale;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field strength: value
//field playerAction: value
