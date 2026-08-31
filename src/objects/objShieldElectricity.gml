#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
event_inherited();
reflects = false;
destroyInWater = true;
image_speed = 0.35;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Follow body
x = floor(body.x);
y = floor(body.y);
image_angle = body.image_angle;

// Depth
if (floor(image_index) mod 2 == 0) {
    depth = -2;
} else {
    depth = 0;
}

var _target;
_target = body;

with (objRing) {
    if (value == 1 && target == noone && distance_to_object(other) < 65) {
        MarkAsActive();
        target = _target;
    }
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
