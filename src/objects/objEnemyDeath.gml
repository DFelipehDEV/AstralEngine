#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create
DeactivateExceptionsAdd(id);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
DeactivateExceptionsRemove(id);

CreateDummy(x + random_range(-30, 30), y + random_range(-30, 30), choose(sprExplosion, sprExplosion2), 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);
CreateDummy(x + random_range(-30, 30), y + random_range(-30, 30), choose(sprExplosion, sprExplosion2), 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);
CreateDummy(x + random_range(-30, 30), y + random_range(-30, 30), choose(sprExplosion, sprExplosion2), 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);

PlaySound(choose(sndExplosion, sndExplosion2));

repeat(choose(4, 5, 6)) {
    metal = instance_create(x, y, objEnemyMetal);
    metal.hspeed = random_range(-3, 3);
    metal.vspeed = random_range(-5, -3);
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spin
image_angle += hspeed + vspeed;
