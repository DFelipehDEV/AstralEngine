#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
image_speed = 0;
value = 1;
collected = false;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
if (collected) {
    if (value == 1) {
        instance_create(x, y, objRingCollected);
        PlaySoundSingle(sndRing);
    } else {
        with (instance_create(x, y, objRingCollected)) {
            sparkleOffset = 20;
        }
        with (instance_create(x, y, objRingNumber)) {
            image_index = value == 10;
            image_speed = 0;
        }
        PlaySoundSingle(sndRingSuper);
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
image_index = global.gameTime div 80;
