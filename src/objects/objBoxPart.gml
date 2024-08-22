#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables, animation and gravity

DeactivateExceptionsAdd(id);
image_speed = 0;

gravity = 0.23;
image_xscale = random_range(1, 0.6);

timer = 0;
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
/// Rotation

// Calculate random rotation speed based on vertical speed
var _rotSpeed;
_rotSpeed = 3 + abs(vspeed) + irandom_range(-1, 1);

// Rotate
image_angle += _rotSpeed;
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
timer += 1;

if (timer > 60) {
    instance_destroy();
}
