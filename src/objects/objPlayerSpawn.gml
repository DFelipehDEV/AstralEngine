#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create player

DeactivateExceptionsAdd(id);
player = noone;
if (!instance_exists(global.playerCheckpoint)) {
    player = instance_create(x, y - 12, objPlayer);
    player.xDirection = sign(image_xscale);
}
else {
    player = instance_create(global.playerCheckpoint.x, global.playerCheckpoint.y - 17, objPlayer);
    player.xDirection = sign(global.playerCheckpoint.image_xscale);
}

var _titlecard;
_titlecard = instance_create(player.x, player.y, objEventTitleCard);
_titlecard.player = player;

instance_destroy();
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
