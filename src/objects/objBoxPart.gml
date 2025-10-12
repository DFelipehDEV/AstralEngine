#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
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
image_angle += 3 + abs(vspeed) + irandom_range(-1, 1);
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
