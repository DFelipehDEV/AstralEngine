/// PlayerStateTurn()

PlayerXMovement();
if (animationFinished) {
    xDirection = -xDirection;
    PlayerSetState(PlayerStateNormal);
    PlayerAnimationNormal();
}
if (ground)
    PlayerJump();
