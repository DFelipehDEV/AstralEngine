#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create player
MarkAsActive();
player = noone;
checkpoint = ds_map_get(global.currentCheckpoint, "instance");
if (!instance_exists(checkpoint)) {
    player = instance_create(x, y - 12, objPlayer);
    player.xDirection = sign(image_xscale);
} else {
    player = instance_create(checkpoint.x, checkpoint.y - 17, objPlayer);
    player.xDirection = sign(checkpoint.image_xscale);
    player.rings = ds_map_get(global.currentCheckpoint, "rings");
    sysTime.gameTime = ds_map_get(global.currentCheckpoint, "time");
}

var _cam;
_cam = instance_create(player.x, player.y, objCamera);
_cam.target = player;
player.cam = _cam;

var _hud;
_hud = instance_create(player.x, player.y, objPlayerHUD);
_hud.player = player;
player.hud = _hud;

var _titlecard;
_titlecard = instance_create(player.x, player.y, objTitleCard);
_titlecard.player = player;

instance_destroy();
