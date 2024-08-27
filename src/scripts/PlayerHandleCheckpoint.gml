/// PlayerHandleCheckpoint()

var _checkpoint;
_checkpoint = PlayerCollisionHitbox(x, y, objCheckpoint);

if (_checkpoint != noone) {
    if (!_checkpoint.activated) {
        // Check if the player hasn't passed the checkpoint before
        if (global.playerCheckX != _checkpoint.x && global.playerCheckY != _checkpoint.y) {
            // Respawn point
            global.playerCheckTime = global.gameTime;
            global.playerCheckX = _checkpoint.x;
            global.playerCheckY = _checkpoint.y;

            with (_checkpoint){
                sprite_index = sprCheckpointActivated;
                image_speed = 0.3;
                image_index = 0;
                activated = true;
                PlaySound("snd/Checkpoint");
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
