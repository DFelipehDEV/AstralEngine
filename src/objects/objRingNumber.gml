#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
image_xscale += 0.1;
image_yscale += 0.1;

if (image_xscale > 2) {
    // Fade out
    image_alpha -= 0.15;

    if (image_alpha <= 0) {
        instance_destroy();
    }
}
