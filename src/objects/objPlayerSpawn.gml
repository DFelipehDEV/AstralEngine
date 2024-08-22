#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create player

DeactivateExceptionsAdd(id);
if (global.playerCheckX == 0 && global.playerCheckY == 0) {
    global.player[0] = instance_create(x, y - 12, objPlayer);
    with (global.player[0]) {
        xDirection = other.image_xscale;
    }
}
else {
    global.player[0] = instance_create(global.playerCheckX, global.playerCheckY - 17, objPlayer);
    with (global.player[0]) {
        xDirection = instance_nearest(x, y, objCheckpoint).image_xscale;
    }
}

instance_destroy();
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
