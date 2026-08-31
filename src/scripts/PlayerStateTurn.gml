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
PlayerApplySlopeFactor(global.timeScale);
PlayerRotateSpriteToAngle();
if (stateTimer > 8) {
    xDirection = -xDirection;
    StatesSet(PlayerStateNormal);
    AnimationPlay("IDLE");
}
if (ground)
    PlayerJump();
