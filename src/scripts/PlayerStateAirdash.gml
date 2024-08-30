/// PlayerStateAirdash()

animationFrameSpeed = 0.55 + abs(xSpeed)/17;

if (ground || PlayerCollisionLeft(x, y, 0, maskBig) || PlayerCollisionRight(x, y, 0, maskBig) || stateTimer == 22 || !keyAction) {
    xSpeed = 5 * xDirection;
    ground = false;
    PlayerSetState(PlayerStateJump);
    canAirdash = false;
}
xDirection = esign(xSpeed, xDirection);
