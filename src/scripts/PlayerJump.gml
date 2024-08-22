/// PlayerJump()
if (!PlayerCollisionTop(x, y, angle, maskBig) && keyActionPressed) {
    PlayerSetAction(PlayerActionJump);

    PlaySound("sndPlayerJump");
    PlaySound("sndPlayerSpin");
}
