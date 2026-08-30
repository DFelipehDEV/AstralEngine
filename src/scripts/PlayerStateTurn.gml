/// PlayerStateTurn()
if (stateEntering) {
    keyRight = false;
    keyLeft = false;
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();
PlayerRotateSpriteToAngle();
if (stateTimer > 8) {
    xDirection = -xDirection;
    StatesSet(PlayerStateNormal);
    AnimationApply("IDLE");
}
if (ground)
    PlayerJump();
