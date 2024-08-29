#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Size/scale, color and alpha

image_index = 1
image_speed = 0;

scalespeed = 0.2;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy, increase size and fade

// Destroy
if (image_alpha <= 0) {
    instance_destroy();
}

if (image_xscale > 0.5) {
    // Fade
    image_alpha -= 0.15;
}

// Increase size/scale
image_xscale += scalespeed;
image_yscale += scalespeed;


// Rotate
//image_angle  += 12;
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
