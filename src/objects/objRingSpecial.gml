#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
image_speed = 0;
value = 50;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
if (collected) {
    with(instance_create(x, y, objRingCollected)) {
        sparkleOffset = 30;
    }
    PlaySoundSingle(sndRingSpecial);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
image_index = global.gameTime div 40;

image_angle = global.gameTime / 8.3;
if (distance_to_object(objPlayer) < 140) {
    image_xscale = min(lerp(image_xscale, 1 - floorto(abs(objPlayer.x - x)/300, 0.15), 0.2), 1);
    image_yscale = image_xscale;
} else {
    image_xscale = max(image_xscale - 0.05, 0);
    image_yscale = image_xscale;
}
