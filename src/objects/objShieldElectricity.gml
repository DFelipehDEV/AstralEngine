#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_speed = 0.35;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Position, angle and depth

x = floor(body.x);
y = floor(body.y);

// Rotate
image_angle = body.image_angle;

// Depth
if (floor(image_index) mod 2 == 0) {
    depth = -2;
}
else {
    depth = 0;
}
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
