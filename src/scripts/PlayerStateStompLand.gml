/// PlayerStateStompLand()
if (stateEntering) {
    AnimationApply("STOMP_LAND");
    exit;
}
if (stateExiting) {
    exit;
}

PlayerJump();
if angleMode != 0 {
    // Slide if is moving
    if abs(xSpeed) < 8 {
        xSpeed = 8 * sign(xSpeed);
    }
    StatesSet(PlayerStateSlide);
    PlaySound(sndPlayerSlide);
}

if (stateTimer > 17) {
    StatesSet(PlayerStateNormal);
}
