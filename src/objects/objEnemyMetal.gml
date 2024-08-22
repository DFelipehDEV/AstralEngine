#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables, animation and gravity

DeactivateExceptionsAdd(id);
flameTimer = 25; // Time in frames to create a flame explosion

image_index = choose(0, 1, 2, 3, 4, 5);
image_speed = 0;

gravity = 0.23;
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
/// Flames and rotation

// Check if the flame timer is 0
if (flameTimer == 0) {
    flameTimer = 25;
    // Create explosion
    DummyEffectCreate(x, y, sprVFXExplosion2, 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);
}
else {
    flameTimer -= 1;
}

// Rotate
image_angle += 2 + abs(vspeed);
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

instance_destroy();
