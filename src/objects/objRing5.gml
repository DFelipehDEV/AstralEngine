#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// On Collect
collector.rings += 5;
with (instance_create(x, y, objRingCollected)) {
    sparkleOffset = 20;
}
with (instance_create(x, y, objRingNumber)) {
    image_index = 0;
    image_speed = 0;
}
PlaySoundSingle(sndRingSuper);
instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw ring 5
draw_sprite(sprRingNumber, 0, x, y);
draw_self();
