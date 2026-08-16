#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables, animation and gravity
MarkAsActive();
flameTimer = 25;

image_index = choose(0, 1, 2, 3, 4, 5);
image_speed = 0;

gravity = 0.23 * global.timeScale;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Flames and rotation
if (flameTimer == 0) {
    flameTimer = 25;
    CreateDummy(x, y, sprExplosion2, 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);
}
else {
    flameTimer -= 1;
}

image_angle += (2 + abs(vspeed)) * global.timeScale;
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
instance_destroy();
