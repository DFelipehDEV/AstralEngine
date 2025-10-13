/// PlayerHandleGimmicks()
if (abs(xSpeed) >= 6 && ground) {
    var _corkscrew;
    _corkscrew = PlayerCollisionObjectMain(x, y, objCorkscrew);
    // Check if is coliding with the corkscrew and is going fast in flat ground
    if (_corkscrew != noone && state != PlayerStateCorkscrew) {
        // Check if is not rolling
        if (animation != "ROLL" && animation != "CORKSCREW") {
            // If is not rolling, walk on the corkscrew
            AnimationApply("CORKSCREW");
        }
        StatesSet(PlayerStateCorkscrew);
        PlayerSetGround(false);
        PlayerSetAngle(0);
    }
}

var _swing;
_swing = PlayerCollisionObjectMain(x, y, objSwingPole);
if (_swing != noone && state != PlayerStateGrab) {
    if (!PlayerCollisionObjectMain(xprevious, yprevious, objSwingPole)) {
        canMove = false;
        xSpeed = 0;
        ySpeed = 0;

        StatesSet(PlayerStateGrab);
        AnimationApply("HANG_3");
        with (_swing) {
            active = true;
            player = other.id;
        }
    }
}
