/// PlayerHandleWallJump()

if ((state == PlayerStateJump || state == PlayerStateNormal || state == PlayerStateSpring) && !ground) {
    var _wallL, _wallR;
    _wallL = PlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpSensor)

    // Check if its going on the direction of a left wall and touching the trigger
    if (_wallL != noone && xDirection == -1 && xSpeed <= 0) {
        StatesSet(PlayerStateWalljump)

        xDirection = 1;
        PlaySound(sndGrab, 1, 0.8);
    }

    _wallR = PlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpSensor)

    // Check if its going on the direction of a right wall and touching the trigger
    if (_wallR != noone && xDirection == 1 && xSpeed >= 0) {
        StatesSet(PlayerStateWalljump)

        xDirection = -1;
        PlaySound(sndGrab, 1, 0.8);
    }
}
