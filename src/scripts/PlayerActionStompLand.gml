/// PlayerActionStompLand()

PlayerJump();
if angleMode != 0 {
    // Slide if is moving
    if abs(xSpeed) < 8 {
        xSpeed = 8 * sign(xSpeed);
    }
    PlayerSetAction(PlayerActionSlide);
    PlaySound("snd/PlayerSlide");
}

if (animationIndex == "STOMP_LAND") {
    if (animationFinished) {
        PlayerSetAction(PlayerActionNormal);
    }
}
