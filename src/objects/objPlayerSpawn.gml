#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create player

DeactivateExceptionsAdd(id);
player = instance_number(objPlayer);
if (global.playerCheckX == 0 && global.playerCheckY == 0) {
    global.player[player] = instance_create(x, y - 12, objPlayer);
    with (player) {
        xDirection = other.image_xscale;
    }
}
else {
    player = instance_create(global.playerCheckX, global.playerCheckY - 17, objPlayer);
    with (player) {
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
