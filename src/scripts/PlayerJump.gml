/// PlayerJump()
if (!PlayerCollisionTop(x, y, angle, maskBig) && keyActionPressed) {
    PlayerSetState(PlayerStateJump);

    PlaySound(sndPlayerJump);
    PlaySound(sndPlayerSpin);
}
