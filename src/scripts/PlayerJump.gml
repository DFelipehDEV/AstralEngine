/// PlayerJump()
if (keyActionPressed) {
    if (!PlayerCollisionTop(x, y, angle, maskBig)) {
        if (ground) {
            ySpeed = angleCos*(jumpStrength/2) - angleSin * xSpeed/1.8;
            xSpeed = angleCos*xSpeed + angleSin*jumpStrength;
            PlayerSetAngle(0);
            PlayerSetGround(false);
        }
        StatesSet(PlayerStateJump);

        PlaySound(sndPlayerJump);
        PlaySound(sndPlayerSpin);
    }
}
