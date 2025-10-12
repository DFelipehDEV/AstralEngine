#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
DeactivateExceptionsAdd(id);
image_speed = 0.17;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
DeactivateExceptionsRemove(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement
vspeed = approach(vspeed, -0.9, 0.17);

if (image_index > 7) {
    image_index = 5;
}

if (!place_meeting(x, y - 22, objWater)) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw bubble
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index, image_index, x + dcos(global.gameTime/5)*4, y);
draw_set_blend_mode(bm_normal)
