/// PlayerJump()
if (!PlayerCollisionTop(x, y, angle, maskBig) && keyActionPressed) {
    PlayerSetAction(PlayerActionJump);

    PlaySound("snd/PlayerJump");
    PlaySound("snd/PlayerSpin");
}
