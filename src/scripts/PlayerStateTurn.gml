/// PlayerStateTurn()
if (stateEntering) {
    keyRight = false;
    keyLeft = false;
    xSpeed = 0;
    AnimationApply("TURN");
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();
if (stateTimer > 8) {
    xDirection = -xDirection;
    StatesSet(PlayerStateNormal);
    PlayerAnimationNormal();
}
if (ground)
    PlayerJump();
