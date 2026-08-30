#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
image_speed = 0.3;

strength = 8;
playerAction = PlayerStateSpring; //Player state when he meets the dash ring
interactSound = sndDashRing;

scale = 1;
initialScale = image_xscale;
animation = 0; // 0 - not animating, 1 - shrink, 2 - grow
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
if (animation == 0) exit;
switch (animation) {
    // shrink
    case 1:
        scale = max(scale - 0.075 * global.timeScale, 0.5);
        if (scale == 0.5) {
            animation = 2;
        }
        break;
    // grow
    case 2:
        scale = min(scale + 0.075 * global.timeScale, 1);
        if (scale == 1) {
            animation = 0;
        }
        break;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//override grid 32,32,0,0
//field strength: value
//field playerAction: script
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);
