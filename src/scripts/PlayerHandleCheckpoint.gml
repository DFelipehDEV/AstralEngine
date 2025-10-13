/// PlayerHandleCheckpoint()
var _checkpoint;
_checkpoint = PlayerCollisionHitbox(x, y, objCheckpoint);

if (_checkpoint != noone) {
    if (!_checkpoint.activated) {
        // Check if the player hasn't passed the checkpoint before
        if (global.playerCheckpoint != _checkpoint) {
            // Respawn point
            global.playerCheckTime = global.gameTime;
            global.playerCheckpoint = _checkpoint;

            with (_checkpoint) {
                sprite_index = sprCheckpointActivated;
                image_speed = 0.3;
                image_index = 0;
                activated = true;
                PlaySound(sndCheckpoint);
            }
        }
        else {
            with (_checkpoint) {
                sprite_index = sprCheckpointActivated;
                image_speed = 0.3;
                image_index = 0;
                activated = true;
            }
        }
    }
}
