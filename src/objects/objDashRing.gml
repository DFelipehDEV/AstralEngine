#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

dashStrength = 8;
dashRingType = "NORMAL";     //Dash ring type  "NORMAL" - Normal dash ring  "RAINBOW" - Rainbow dash ring
dashRingPAct = PlayerStateSpring; //Player state when he meets the dash ring

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
//field dashStrength: value
//field dashRingPAct: value
