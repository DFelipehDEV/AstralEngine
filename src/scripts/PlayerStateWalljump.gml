/// PlayerStateWalljump()

ySpeed = lerp(ySpeed, 1.5, 0.09);

if (keyActionPressed) {
    xSpeed = 6*xDirection;
    ySpeed = -6;

    PlayerSetState(PlayerStateNormal);
    AnimationApply("LAUNCH");
    PlaySound(sndPlayerJump);
}

if (!PlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpSensor) && !PlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpSensor)) {
    PlayerSetState(PlayerStateNormal);
}
