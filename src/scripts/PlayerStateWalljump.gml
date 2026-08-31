/// PlayerStateWalljump()
if (stateEntering) {
    xSpeed = 0;
    AnimationPlay("WALLGRAB");
    exit;
}
if (stateExiting) {
    exit;
}

ySpeed = lerp(ySpeed, 1.5, 0.09 * global.timeScale);

if (keyActionPressed) {
    xSpeed = 6*xDirection;
    ySpeed = -6;

    StatesSet(PlayerStateAir);
    AnimationPlay("LAUNCH");
    PlaySound(sndPlayerJump);
}

if (!PlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpSensor) && !PlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpSensor)) {
    StatesSet(PlayerStateAir);
    AnimationPlay("LANDING");
}
