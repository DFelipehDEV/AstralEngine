/// PlayerStateAirdash()
if (stateEntering) {
    AnimationPlay("JUMP");
    exit;
}
if (stateExiting) {
    exit;
}

ySpeed = 0;
animationSpeed = 0.55 + abs(xSpeed)/17;

if (ground || PlayerCollisionLeft(x, y, 0, maskBig) || PlayerCollisionRight(x, y, 0, maskBig) || stateTimer >= airdashDuration || !keyAction) {
    xSpeed = airdashSpeedOnExit * xDirection;
    PlayerSetGround(false);
    StatesSet(PlayerStateJump);
    canAirdash = false;
}
xDirection = esign(xSpeed, xDirection);
