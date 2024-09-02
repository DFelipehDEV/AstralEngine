#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create player

DeactivateExceptionsAdd(id);
player = instance_number(objPlayer);
if (!instance_exists(global.playerCheckpoint)) {
    global.player[player] = instance_create(x, y - 12, objPlayer);
    global.player[player].xDirection = sign(image_xscale);
}
else {
    global.player[player] = instance_create(global.playerCheckpoint.x, global.playerCheckpoint.y - 17, objPlayer);
    player.xDirection = sign(global.playerCheckpoint.image_xscale);
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
