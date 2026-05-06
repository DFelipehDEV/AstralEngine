/// PlayerHandleCheckpoint()
var _checkpoint;
_checkpoint = PlayerCollisionHitbox(x, y, objCheckpoint);

if (_checkpoint != noone) {
    if (_checkpoint.activated) exit;

    if (ds_map_get(global.currentCheckpoint, "instance") != _checkpoint) {
        ds_map_set(global.currentCheckpoint, "instance", _checkpoint);
        ds_map_set(global.currentCheckpoint, "rings", rings);
        ds_map_set(global.currentCheckpoint, "time", global.gameTime);

        with (_checkpoint) {
            sprite_index = sprCheckpointActivated;
            image_speed = 0.3;
            image_index = 0;
            activated = true;
            PlaySound(sndCheckpoint);
        }
    } else {
        with (_checkpoint) {
            sprite_index = sprCheckpointActivated;
            image_speed = 0.3;
            image_index = 0;
            activated = true;
        }
    }
}
