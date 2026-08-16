#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
event_inherited();
value = 10;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// On Collect
with (instance_create(x, y, objRingCollected)) {
    sparkleOffset = 20;
}
with (instance_create(x, y, objRingNumber)) {
    image_index = 1;
    image_speed = 0;
}
PlaySoundSingle(sndRingSuper);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw ring 10
draw_sprite(sprRingNumber, 1, x, y);
draw_self();
