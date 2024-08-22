/// PlayerActionAirdash()

animationFrameSpeed = 0.55 + abs(xSpeed)/17;

if (ground || PlayerCollisionLeft(x, y, 0, maskBig) || PlayerCollisionRight(x, y, 0, maskBig) || actionTimer == 22 || !keyAction) {
    xSpeed = 5 * xDirection;
    ground = false;
    PlayerSetAction(PlayerActionJump);
    airdashPossible = false;
}
xDirection = esign(xSpeed, xDirection);
