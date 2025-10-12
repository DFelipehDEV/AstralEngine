#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
image_index = 1
image_speed = 0;

scalespeed = 0.2;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
image_xscale += scalespeed;
image_yscale += scalespeed;

if (image_xscale > 0.5) {
    image_alpha -= 0.15;
}

if (image_alpha <= 0) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw effect

draw_set_blend_mode(bm_add);
draw_self();
draw_set_blend_mode(bm_normal);
