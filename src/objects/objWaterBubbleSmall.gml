#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create
MarkAsActive();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement
vspeed = approach(vspeed, -0.9, 0.17);
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw bubble
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index, global.gameTime/30, x + dcos(global.gameTime/3)*5, y);
draw_set_blend_mode(bm_normal)
