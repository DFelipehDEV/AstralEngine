/// PlayerJump()
if (!PlayerCollisionTop(x, y, angle, maskBig) && keyActionPressed) {
    if (ground) {
        ySpeed = angleCos*(jumpStrength/2) - angleSin * xSpeed/1.8;
        xSpeed = angleCos*xSpeed + angleSin*jumpStrength;
        PlayerSetAngle(0);
    }
    PlayerSetState(PlayerStateJump);

    PlaySound(sndPlayerJump);
    PlaySound(sndPlayerSpin);
}
