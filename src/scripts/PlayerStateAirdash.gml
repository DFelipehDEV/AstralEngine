/// PlayerStateAirdash()
if (stateEntering) {
    AnimationApply("JUMP");
    exit;
}
if (stateExiting) {
    exit;
}

animationSpeed = 0.55 + abs(xSpeed)/17;

if (ground || PlayerCollisionLeft(x, y, 0, maskBig) || PlayerCollisionRight(x, y, 0, maskBig) || stateTimer >= 22 || !keyAction) {
    xSpeed = airdashSpeed * xDirection;
    PlayerSetGround(false);
    StatesSet(PlayerStateJump);
    canAirdash = false;
}
xDirection = esign(xSpeed, xDirection);
