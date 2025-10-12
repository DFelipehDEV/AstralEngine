#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
image_xscale = 0.1;
image_yscale = 0.1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Follow and animate
image_xscale += 0.35;
image_yscale += 0.35;
image_alpha  -= 0.03;

if (image_xscale > 19.5) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw shockwave
draw_set_blend_mode(bm_add);
draw_self();
draw_set_blend_mode(bm_normal);
