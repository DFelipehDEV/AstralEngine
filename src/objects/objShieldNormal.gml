#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_speed = 0.3;
image_alpha = 0.9;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Position, angle and destroy

// Shift to the player position
x = floor(ownerID.x);
y = floor(ownerID.y);

// Rotate
image_angle = ownerID.image_angle;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw shield

draw_set_blend_mode(bm_add);
draw_self();
draw_set_blend_mode(bm_normal);
