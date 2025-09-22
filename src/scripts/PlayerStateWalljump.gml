/// PlayerStateWalljump()
if (stateEntering) {
    xSpeed = 0;
    AnimationApply("WALLGRAB");
    exit;
}
if (stateExiting) {
    exit;
}

ySpeed = lerp(ySpeed, 1.5, 0.09);

if (keyActionPressed) {
    xSpeed = 6*xDirection;
    ySpeed = -6;

    StatesSet(PlayerStateNormal);
    AnimationApply("LAUNCH");
    PlaySound(sndPlayerJump);
}

if (!PlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpSensor) && !PlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpSensor)) {
    StatesSet(PlayerStateNormal);
}
