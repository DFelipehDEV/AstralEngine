/// PlayerStateAirdash()

animationSpeed = 0.55 + abs(xSpeed)/17;

if (ground || PlayerCollisionLeft(x, y, 0, maskBig) || PlayerCollisionRight(x, y, 0, maskBig) || stateTimer >= 22 || !keyAction) {
    xSpeed = airdashSpeed * xDirection;
    PlayerSetGround(false);
    PlayerSetState(PlayerStateJump);
    canAirdash = false;
}
xDirection = esign(xSpeed, xDirection);
