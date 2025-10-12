#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
image_xscale = 0.4;
image_yscale = 0.4;
image_alpha = 0.6;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
image_xscale += 0.05;
image_yscale += 0.05;
image_alpha -= 0.05;

if (image_alpha <= 0) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw rainbow
draw_set_blend_mode(bm_add);
draw_self();
draw_set_blend_mode(bm_normal);
