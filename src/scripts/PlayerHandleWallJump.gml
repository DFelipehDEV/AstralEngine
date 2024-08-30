/// PlayerHandleWallJump()

if ((state == PlayerStateJump || state == PlayerStateNormal || state == PlayerStateSpring) && !ground) {
    var _wallL, _wallR;
    _wallL = PlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpTrigger)

    // Check if its going on the direction of a left wall and touching the trigger
    if (_wallL != noone && xDirection == -1 && xSpeed <= 0) {
        PlayerSetState(PlayerStateWalljump)

        xDirection = 1;
        PlaySoundExt("snd/Grab", global.volumeSounds, 0.8, false);
    }

        _wallR = PlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpTrigger)

    // Check if its going on the direction of a right wall and touching the trigger
    if (_wallR != noone && xDirection == 1 && xSpeed >= 0) {
        PlayerSetState(PlayerStateWalljump)

        xDirection = -1;
        PlaySoundExt("snd/Grab", global.volumeSounds, 0.8, false);
    }
}
