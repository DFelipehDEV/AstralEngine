/// PlayerHandleWallJump()
if (!ground) {
    var _wall;
    if (xDirection == -1) {
        _wall = PlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpSensor);
        if (_wall != noone && xSpeed <= 0) {
            xDirection = 1;
            StatesSet(PlayerStateWalljump);
            PlaySound(sndGrab, 1, 0.8);
        }
    } else {
        _wall = PlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpSensor);
        if (_wall != noone && xSpeed >= 0) {
            xDirection = -1;
            StatesSet(PlayerStateWalljump);
            PlaySound(sndGrab, 1, 0.8);
        }
    }
}
