/// PlayerStateStompLand()

PlayerJump();
if angleMode != 0 {
    // Slide if is moving
    if abs(xSpeed) < 8 {
        xSpeed = 8 * sign(xSpeed);
    }
    PlayerSetState(PlayerStateSlide);
    PlaySound("snd/PlayerSlide");
}

if (animation == "STOMP_LAND") {
    if (animationFinished) {
        PlayerSetState(PlayerStateNormal);
    }
}
