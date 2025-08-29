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

scale = 1;
initialScale = image_xscale;

image_speed = 0.3;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (scale < 1) {
    scale = min(scale + 0.04, 1);
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);
