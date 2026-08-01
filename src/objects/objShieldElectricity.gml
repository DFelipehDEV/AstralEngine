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

var _nearRing, _target;
_nearRing = instance_nearest(x, y, objRing);
_target = body;

if (distance_to_object(_nearRing) < 65) {
    with (_nearRing) {
        instance_destroy();
        with (instance_create(x, y, objRingMagnetic)) {
            target = _target;
        }
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
