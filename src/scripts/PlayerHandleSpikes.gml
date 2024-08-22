/// PlayerHandleSpikes()
// Handle collision with spikes

if (instance_exists(objSpike)) {
    var _nearSpike;
    _nearSpike = instance_nearest(x, y, objSpike);

    var _spike;
    _spike = PlayerCollisionObjectBottom(x, y, _nearSpike.image_angle, maskBig, objSpike);

    // Check if the player is meeting a spike
    if (_spike != noone) {
        // Hurt player
        PlayerHurt();
    }
}
