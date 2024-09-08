#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init

sID = 0;
image_speed = 0;

AnimationInit(AnimationIndexSonic);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation system and rotation

AnimationSystem(AnimationIndexSonic);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(animationSprite, floor(animationFrame), floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
